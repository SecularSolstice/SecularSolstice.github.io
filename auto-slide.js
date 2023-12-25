let slide = 0;
let lyric = 0;
let quicklinks = [];
let content = [];
let h2s = [];

$(()=>{
    $('body').empty();
    let ul = $('<ul>').css({
        position: 'absolute',
        left: 0,
        top: 0,
        fontSize: 'x-small',
        width: '10%',
        whiteSpace: 'nowrap',
        overflow: 'hidden',
        zIndex:10}).appendTo($('body'));
    quicklinks = slides.map( (slide,i) => 
        $('<li>').text(slide.title).on('click',()=>{startSlide(i);}).appendTo(ul)
                           );
    $('<input type=button value=next>').css({position:'absolute',
					     bottom:0,
					     left:0,
					     zIndex:11,
					     width:'10vw',
					     fontSize:'4vw',
					     height:'3em',
					     opacity:0.3}).on('click', async ()=>{
        if ( ! advanceLyrics() && ! await advanceSpeech() ){
            startSlide(slide+1);
        }}).
        appendTo($('body'));
    startSlide(0);
});

function startSlide(x) {
    slide = x;
    for (let li of quicklinks) {
        li.css({fontWeight:'normal'});
    }
    quicklinks[slide].css({fontWeight:'bold'});
    for (let i of content) i.remove();
    for (let i of h2s) i.remove();
    content = [];
    h2s = [];

    for (let i=slide; i>=0; i--) {
	let s = slides[i];
	if (s.type == 'section') {
	    if (s.title in {Evening:1, Light:1, Morning:1}) {
		$('html').attr('class','light');
            } else {
		$('html').attr('class','dark');
            }
            if (s.title in {Evening:1, Light:1, Bright:1}) {
		$('html').css({backgroundImage: 'url(../../snow-bkg.jpg)'});
            } else if (s.title in {Twilight:1, Eve:1}) {
		$('html').css({backgroundImage: 'url(../../twilight.jpg)'});
            } else if (s.title in {Night:1, Darkness:1, Dark:1}) {
		$('html').css({backgroundImage: 'url(../../stars.jpg)'});
            } else if (s.title in {Morning:1}) {
		$('html').css({backgroundImage: 'url(../../cityscape.jpg)'});
            } else if (s.title in {"Days to Come":1, Tomorrow:1, Coda:1, Afterwards:1}) {
		$('html').css({backgroundImage: 'url(../../high-altitude.jpg)'});
            } else { // if (s.title in {Dusk:1, Dawn:1}) {
		$('html').css({backgroundImage: 'url(../../dawn-bkg.jpg)'});
            }
	    break;
	}
    }
    
    let s = slides[slide];
    if (s.type=='section') {
        h2s.push( $('<h1>').text(s.title).css({position:'absolute',
                                               top:'45vh',
                                               width:'90vw',
					       left:'10vw',
                                               textAlign:'center'}).appendTo($('body')) );
    }
    if (s.type=='song') {
        h2s.push( $('<div class=autolyric>').text(s.attribution).appendTo($('body')) );
        h2s.push( $('<div class=autolyric>').text(s.title).appendTo($('body')) );
        for (let i=0; i<4; i++) {
            h2s.push( $('<div class=autolyric>').text(s.lyrics[i] || '...').appendTo($('body')) );
        }
        positionLyrics();
        lyric=0;
        if (s.youtube) {
            content.push($(`<iframe src="https://www.youtube.com/embed/${s.youtube}?autoplay=1"
                       frameborder="0" 
                       allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
               </iframe>`).
                         css({position:'absolute',bottom:0,left:'30vw',width:'40vw',height:'30vw',zIndex:-1,opacity:0.6}).
                         appendTo($('body')));
        } else if (s.mp3) {
            content.push($(`<audio src=${s.mp3} autoplay controls>`).css({position:'absolute',
                                                                          bottom:0,
                                                                          left:'15vw',
                                                                          right:'15vw',
                                                                          width:'70vw',
                                                                          opacity:0.5
                                                                         }).appendTo($('body')));
        }
        
    }
    if (s.type=='text') {
	let theme = $('html').attr('class');
	content.push($(`<iframe src=../../speeches/gen/${s.link}.html?trans${theme} 
                                class=speech 
                                allowtransparency=true></iframe>`).css({
	    position: 'absolute',
	    left: '12vw',
	    width: '86vw',
	    top: '2vw',
	    height:'calc(100vh - 4vw)',
	    border:'1px dotted grey'}).appendTo($('body')));
    }
}

function advanceLyrics() {
    let s = slides[slide];
    console.log('al');
    if ( ! s.lyrics) {console.log('no lyrics',slide,s); return false};
    if ( lyric >= s.lyrics.length) {console.log(s.lyrics.length);return false;}
    if ( lyric < s.lyrics.length-4) {
        h2s.push(
            $('<div class=autolyric>').text(s.lyrics[lyric+4]||'...').appendTo($('body')) );
    }
    h2s.shift().remove();
    lyric++;
    positionLyrics();
    return true;
}

async function advanceSpeech() {
    let ifr = $('iframe.speech');
    if (ifr.length == 0) {
	return false;
    }
    let y = ifr[0].contentWindow.pageYOffset
    let delta = Math.floor(window.innerHeight * 0.7);
    ifr[0].contentWindow.scrollTo({top:y+delta, behavior:'smooth'});
    await new Promise( res => window.setTimeout(res, 32) );
    let y2 = ifr[0].contentWindow.pageYOffset
    return y != y2;
}
    
function positionLyrics() {
    for (let i=0; i<h2s.length; i++) {
        h2s[i].animate({top: i*15+5+'vh',
                            fontSize:15-Math.abs(i-1)*2+'pt'});
        h2s[i].attr({'class': i==1 ? 'autolyric hl' : 'autolyric'});
    }
}
