let slide = 0;
let lyric = 0;
let quicklinks = [];
let nonlyrics = [];
let lyrics = [];
let slides = [];
let ctrls = [];

function startShow(_slides){
    console.log({_slides});
    slides = _slides;
    $('body *').css('display','none');
    let ul = $('<ul>').css({position: 'absolute',
			    left: 0,
			    top: 0,
			    fontSize: 'x-small',
			    width: '20vw',
			    padding: '2px',
			    whiteSpace: 'nowrap',
			    overflowX: 'hidden',
			    overflowY: 'auto',
			    zIndex: 10,
			    height: 'calc(100vh - 14vw - 8px)'}).appendTo($('body'));
    quicklinks = slides.map( (slide,i) => 
        $('<li>').text(slide.title)
		 .on('click',()=>{startSlide(i);})
		 .append(slide.specifier ?
			 $(`<div>${slide.specifier}</div>`).css({fontSize:'smaller',
								 paddingLeft:'3em'}) :
			 null)
		 .appendTo(ul)
    );
    ctrls.push(ul);
    ctrls.push(
	$('<div>Next</div>')
	    .css({position:'absolute',
		  bottom:0,
		  left:0,
		  zIndex:11,
		  width:'20vw',
		  fontSize:'4vw',
		  height:'12vw',
		  lineHeight:'12vw',
		  textAlign:'center',
		  opacity:0.3,
		  cursor:'pointer',
		  border:'2px outset grey',
		  background:'grey',
		  margin:'2px'}).on('click', async ()=>{
		      if ( ! advanceLyrics() && ! await advanceSpeech() ){
			  startSlide(slide+1);
		      }}).
            appendTo($('body'))
    );
    ctrls.push(
	$('<div>Back to Editor</div>')
	    .css({position:'absolute',
		  bottom: '12vw',
		  left:0,
		  zIndex:11,
		  width:'20vw',
		  fontSize:'2vw',
		  height:'2vw',
		  lineHeight:'2vw',
		  textAlign:'center',
		  opacity:0.3,
		  cursor:'pointer',
		  border:'2px outset #955',
		  background:'#955',
		  margin:'2px'})
	    .on('click', cancelSlides)
	    .appendTo($('body'))
    );
    startSlide(0);
}

function cancelSlides() {
    for (let i of nonlyrics) i.remove();
    for (let i of lyrics) i.remove();
    for (let i of ctrls) i.remove()
    $('body *').css('display','');
    slide = 0;
    lyric = 0;
    ctrls = [];
    quicklinks = [];
    nonlyrics = [];
    lyrics = [];
}	

function startSlide(x) {
    slide = x;
    for (let li of quicklinks) {
        li.css({fontWeight:'normal'});
    }
    quicklinks[slide].css({fontWeight:'bold'});
    for (let i of nonlyrics) i.remove();
    for (let i of lyrics) i.remove();
    nonlyrics = [];
    lyrics = [];

    for (let i=slide; i>=0; i--) {
	let s = slides[i];
	if (s.type == 'section' && ! s.title.startsWith('??')) {
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
        nonlyrics.push( $('<h1>').text(s.title).css({position:'absolute',
						     top:'45vh',
						     width:'90vw',
						     left:'10vw',
						     textAlign:'center'}).appendTo($('body')) );
    }
    if (s.type=='song') {
        lyrics.push( $('<div class=autolyric>').text(s.attribution).appendTo($('body')) );
        lyrics.push( $('<div class=autolyric>').text(s.title).appendTo($('body')) );
        for (let i=0; i<4; i++) {
            lyrics.push( $('<div class=autolyric>').text(s.lyrics[i] || '...').appendTo($('body')) );
        }
        positionLyrics();
        lyric=0;
        if (s.youtube) {
	    let ifhtml =
		`<iframe src="https://www.youtube.com/embed/${s.youtube}?autoplay=1"
                         frameborder="0" 
                         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
                 </iframe>`;
            nonlyrics.push($(ifhtml).
				css({position:'absolute',
				     bottom:0,
				     left:'40vw',
				     width:'40vw',
				     height:'30vw',
				     zIndex:-1,
				     opacity:0.6}).
				appendTo($('body')));
	} else if (s.bandcamp) {
	    let bgcol = $('html').attr('class') == 'light' ? 'ffffff' : '333333';
	    let ifhtml = `<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=${s.bandcamp.album}/size=large/bgcol=${bgcol}/linkcol=0687f5/tracklist=false/artwork=small/track=${s.bandcamp.track}/transparent=true/" seamless>></iframe>`;
            nonlyrics.push($(ifhtml).
				css({position:'absolute',
				     bottom:0,
				     left:'40vw',
				     width:'40vw',
				     height:'120px',
				     zIndex:-1,
				     opacity:0.6}).
				appendTo($('body')));

        } else if (s.mp3) {
            nonlyrics.push($(`<audio src=${s.mp3} autoplay controls>`).css({position:'absolute',
                                                                            bottom:0,
                                                                            left:'35vw',
                                                                            right:'15vw',
                                                                            width:'50vw',
                                                                            opacity:0.5
            }).appendTo($('body')));
        }
        
    }
    if (s.type=='text') {
	let theme = $('html').attr('class');
	nonlyrics.push($(`<iframe src=../../speeches/gen/${s.link}.html?trans${theme} 
                                class=speech 
                                allowtransparency=true>
                          </iframe>`).css({
			      position: 'absolute',
			      left: '22vw',
			      width: '76vw',
			      top: '2vw',
			      height: `calc(100vh - 4vw - ${s.specifier ? '25pt' : '1px'})`,
			      border:'1px dotted grey'}).appendTo($('body')));
	if (s.specifier) {
	    nonlyrics.push($('<h2>').text(s.specifier)
				    .css({position: 'absolute',
					  left: '22vw',
					  width: '76vw',
					  bottom: '2vw',
					  height: '25pt',
					  margin: 0,
					  overflowX: 'auto',
					  textAlign:'center',
					  whiteSpace:'pre'})
				    .appendTo($('body')));
	}
    }
}
    
function advanceLyrics() {
    let s = slides[slide];
    console.log('al');
    if ( ! s.lyrics) {console.log('no lyrics',slide,s); return false};
    if ( lyric >= s.lyrics.length) {console.log(s.lyrics.length);return false;}
    if ( lyric < s.lyrics.length-4) {
        lyrics.push(
            $('<div class=autolyric>').text(s.lyrics[lyric+4]||'...').appendTo($('body')) );
    }
    lyrics.shift().remove();
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
    await new Promise( res => window.setTimeout(res, 200) );
    let y2 = ifr[0].contentWindow.pageYOffset
    return y != y2;
}
    
function positionLyrics() {
    for (let i=0; i<lyrics.length; i++) {
        lyrics[i].animate({top: i*15+5+'vh',
                            fontSize:15-Math.abs(i-1)*2+'pt'});
        lyrics[i].attr({'class': i==1 ? 'autolyric hl' : 'autolyric'});
    }
}
