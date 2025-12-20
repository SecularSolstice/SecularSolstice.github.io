let isection = 0;
let islide = 0;
let isubslide = 0;

let slide=null;
let prev=null;
let curr=null;
let next=null;
let video=null;
let instructions=null;
let jumpul=null;

const lyricCss = {
    whiteSpace: 'pre',
    position: 'absolute',
    color: 'white',
    textShadow: '.5px .5px grey, -.5px -.5px grey',
    left: '10vw',
    fontWeight: 'bold',
    display: 'flex',
    flexDirection: 'column',
    zIndex: 2
}; 

const prevCss = {
    fontSize: '3vh',
    top: '7vh',
    height: '13vh',
    justifyContent: 'end',
    transform: 'scaleY(0.8)',
    opacity: 0.8,
    ...lyricCss
}

const currCss = {
    fontSize: '4vh',
    top: '20vh',
    height: '20vh',
    color: '#fff',
    opacity: 1,
    justifyContent: 'center',
    ...lyricCss
}

const nextCss = {
    fontSize: '3vh',
    top: '40vh',
    height: '10vh',
    transform: 'scaleY(0.8)',
    overflow: 'hidden',
    justifyContent: 'start',
    opacity: 0.8,
    ...lyricCss
}

const darkBarCss = {
    position: 'absolute',
    zIndex: -1,
    top: '10vh',
    height: '40vh',
    left: 0,
    width: '100vw',
    background: 'linear-gradient(to bottom, #0000 0%, #0007 25%, #0007 75%, #0000 100%)'
}

const klasses = {
    sectionHeader: {
        justifyContent: 'start',
        fontSize: '7vh',
        textShadow: '-3px -3px #333. 3px 3px #333'
    },
    sectionHeaderBlack: {
        justifyContent: 'start',
        fontSize: '7vh',
        color: 'black',
        textShadow: '-3px -3px #bbb. 3px 3px #bbb'
    }
}

async function setBkg(fn) {
    let preload = $(`<img src=${fn} style=display:none>`);
    let p = new Promise((res)=>{preload.on('load',res);});
    preload.appendTo($('body'));
    await p;
    preload.remove();
    $('body').css({backgroundImage:`url(${fn})`});
}

function slideVis() {
    setBkg(slide.bkgs[isubslide]);
    $('#darkbar').show();
    if (slide.klass) {
        curr.css(klasses[slide.klass])
        $('#darkbar').hide();
    }
    if (slide.video?.start == isubslide ) {
        video = $('<video>').attr({src: slide.video.src}).css(slide.video.css).appendTo($('body'));
        video[0].play();
        if (prev && slide.video.fadePrev) {
            prev.animate({opacity:0}, slide.video.fadePrev);
        }
    }
    if (video && ( ! slide.video || slide.video.start>isubslide)) {
        video.remove();
        video = null;
    }
    if (instructions) {
        instructions.text(slide.instructions || '');
    }
    let jump = sections[isection].content[islide].jumps[isubslide];
    jumpul.find('li').css({fontWeight:'normal'});
    jump.css({fontWeight:'bold'});
}

function advance() {
    $('#darkbar').show();
    if (slide && slide.lyrics && isubslide<slide.lyrics.length) {
	isubslide -= -1;
	if (prev) prev.remove();
	prev = curr;
	if (prev) prev.animate(prevCss, 500, ()=>{prev.css({justifyContent:prevCss.justifyContent})})
	curr = next;
	if (curr) curr.animate(currCss, 500, ()=>{curr.css({justifyContent:currCss.justifyContent})})
	if (isubslide < slide.lyrics.length) {
	    next = $('<div>').text(slide.lyrics[isubslide]).css(nextCss).css({opacity:0}).animate({opacity:.8},500).appendTo($('body'));
	} else {
	    next = null;
	}
        slideVis();
    } else {
	go(isection, islide+1, 0);
    }
    
    let jump = sections[isection].content[islide].jumps[isubslide];
    jump[0].scrollIntoView({block:'center'});
}

function go(sec, sli, sub) {
    console.log({sec,sli,sub});
    slide = sections[sec].content[sli];
    if ( ! slide ) {
	sec += 1;
	sli = 0;
	sub = 0;
	slide = sections[sec].content[sli];
    }
    isection = sec;
    islide = sli;
    isubslide = sub;
    if (prev) prev.remove();
    if (curr) curr.remove();
    if (next) next.remove();
    if (isubslide == 0) {
	curr = $(`<div><div style="font-size:150%;margin-top:4vh;white-space:normal;">${slide.name || ""}</div>${slide.byline || ""}</div>`).css(currCss).appendTo($('body'));
    }
    if (slide.lyrics) {
	if (isubslide < slide.lyrics.length) {
	    next = $('<div>').text(slide.lyrics[isubslide]).css(nextCss).appendTo($('body'));
	}
	if (isubslide>0) {
	    curr = $('<div>').text(slide.lyrics[isubslide-1]).css(currCss).appendTo($('body'));
	}
	if (isubslide>1) {
	    prev = $('<div>').text(slide.lyrics[isubslide-2]).css(prevCss).appendTo($('body'));
	}
    }
    slideVis();
}

$(()=>{
    $('<div id=darkbar>').css(darkBarCss).appendTo($('body'));
    let nw = window.open();
    $(nw.document.body).css({display:'flex',alignItems:'center'});
    jumpul = $('<ul>').css({height:'90vh',overflow:'scroll',border:'2px grey inset'}).appendTo(nw.document.body);
    instructions = $('<span>').appendTo(nw.document.body);
    for (let isec in sections) {
	sec=sections[isec];
	$('<li>').text(sec.name.replace(/<[^>]*>/g,'')).on('click',()=>go(isec-0,0,0)).appendTo(jumpul)
	let ul2 = $('<ul>').appendTo(jumpul);
	for (let isli in sec.content) {
	    sli = sec.content[isli];
            sli.jumps = []
	    sli.jumps.push( $('<li>').text(sli.name.replace(/<[^>]*>/g,'').replace('\n',' ').replace(/ +/g,' ').substr(0,20)).on('click',()=>go(isec-0,isli-0,0)).appendTo(ul2) )
	    if (sli.lyrics) {
		let ul3 = $('<ul>').appendTo(ul2);
		for (let isub in sli.lyrics) {
		    let lyr = sli.lyrics[isub];
		    sli.jumps.push( $('<li>').text(lyr.substr(0,20)).on('click',()=>go(isec-0,isli-0,isub- -1)).appendTo(ul3) );
                    
		}
	    }
	}
    }
    go(0,0,0);
    $('body').on('keypress', advance).css({backgroundSize:'cover'});
});
	    
