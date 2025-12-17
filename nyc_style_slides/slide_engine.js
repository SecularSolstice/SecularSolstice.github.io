let isection = 0;
let islide = 0;
let isubslide = 0;

let slide=null;
let prev=null;
let curr=null;
let next=null;

const lyricCss = {
    whiteSpace: 'pre',
    position: 'absolute',
    color: 'white',
    textShadow: '.5px .5px grey, -.5px -.5px grey',
    left: '10vw',
}; 

const prevCss = {
    fontSize: '3vh',
    top: '10vh',
    height: '10vh',
    overflow: 'hidden',
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
    ...lyricCss
}

const nextCss = {
    fontSize: '3vh',
    top: '40vh',
    height: '10vh',
    transform: 'scaleY(0.8)',
    overflow: 'hidden',
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
    background: 'linear-gradient(to bottom, #0000 0%, #0004 25%, #0004 75%, #0000 100%)'
}
    

function advance() {
    if (slide && slide.lyrics && isubslide<slide.lyrics.length) {
	isubslide -= -1;
	if (prev) prev.remove();
	prev = curr;
	if (prev) prev.animate(prevCss, 500);
	curr = next;
	if (curr) curr.animate(currCss, 500);
	if (isubslide < slide.lyrics.length) {
	    next = $('<div>').text(slide.lyrics[isubslide]).css(nextCss).css({opacity:0}).animate({opacity:.8},500).appendTo($('body'));
	} else {
	    next = null;
	}
	$('body').css({backgroundImage:`url(${slide.bkgs[isubslide]})`});
    } else {
	go(isection, islide+1, 0);
    }
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
	curr = $(`<div><div style=font-size:150%>${slide.name || "<i>Nameless</i>"}</div>${slide.byline || ""}</div>`).css(currCss).appendTo($('body'));
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
    $('body').css({backgroundImage:`url(${slide.bkgs[isubslide]})`});
}

$(()=>{
    $('<div>').css(darkBarCss).appendTo($('body'));
    go(0,0,0);
    $('body').on('keypress', advance).css({backgroundSize:'cover'});
    let nw = window.open();
    let ul1 = $('<ul>').appendTo(nw.document.body);
    for (let isec in sections) {
	sec=sections[isec];
	$('<li>').text(sec.name).on('click',()=>go(isec-0,0,0)).appendTo(ul1)
	let ul2 = $('<ul>').appendTo(ul1);
	for (let isli in sec.content) {
	    sli = sec.content[isli];
	    $('<li>').text(sli.name).on('click',()=>go(isec-0,isli-0,0)).appendTo(ul2)
	    if (sli.lyrics) {
		let ul3 = $('<ul>').appendTo(ul2);
		for (let isub in sli.lyrics) {
		    let lyr = sli.lyrics[isub];
		    $('<li>').text(lyr.substr(0,20)).on('click',()=>go(isec-0,isli-0,isub- -1)).appendTo(ul3)		    
		}
	    }
	}
    }
});
	    
