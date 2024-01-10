function dbg(str) {
    $('<p>').text(str).appendTo($('#info'));
}

function common_start(l){
    for (var pos=0; pos<999; pos++) {
        for (i in l) {
            if (pos > l[i].length ||
                l[i].substring(0,pos) != l[0].substring(0,pos)) {
                return pos-1;
            }
        }
    }
    return 'ERROR!';
}


$(() => {

    let annots = [];

    cont = $('#content')[0];
    lh = cont.getBoundingClientRect().height / cont.rows;
    for (var i=0; i<$('#content').prop('rows'); i++) {
        annots.push($('<div>').css('position','absolute')
                    .css('top',Math.floor(i*lh)+'px')
                    .css('z-index','0')
                    .appendTo($('#annots')));
    }    

    $('#content').keydown(function(ev){
	if (ev.which!=13) return;
	this.selectionStart = this.selectionEnd;
    });

    $('#content').keyup(function(ev){
	if ( (ev.which<48 || ev.which>127) &&
             ev.which!=8 && // Backspace
             ev.which!=13 && // New line
             ev.which!=46) { // Delete
            return;
	}

	lines = this.value.split('\n')
	for (i in lines) {
            annots[i].empty()
		.css('z-index','0')
		.css('white-space','nowrap');
            li = lines[i].split(':')[0];
            if (li in content) {
		let href = (content[li][2]=='[speech]' ? `/speeches/gen/${li}.html` : `/songs/${li}/gen`);
		$('<a>').text(content[li][0]+' ').attr({href}).css({fontWeight:'bold'}).appendTo(annots[i]);
		$('<i>').text(content[li][1]+': ').appendTo(annots[i]);
		$('<span>').text(content[li][2]).appendTo(annots[i]);
            }
	}
	for (; i<annots.length; i++) {
            annots[i].empty();
	}

	if (ev.which < 48) return;
	
	ss = this.selectionStart;
	se = this.selectionEnd;
	if (ss != se) return;
	val = this.value;
	lastsp = val.lastIndexOf(' ',ss-1);
	lastrt = val.lastIndexOf('\n',ss-1);
	lasthash = val.lastIndexOf('#',ss-1);
	wordstart = Math.max(lastsp,lastrt)+1;
	prefix = val.substring(wordstart,ss);
	if (prefix=='') return;
	//dbg(prefix);
	options=[];
	if (lasthash > lastrt) {
            for (i in sections) {
		if (sections[i].startsWith(prefix)) options.push(sections[i]);
            }
	} else {
            for (c in content) {
		if (c.startsWith(prefix)) options.push(c);
            }
	}
	if (options.length==0) return;
	len_common = common_start(options);
	to_insert = options[0].substring(prefix.length, len_common);
	this.value = val.substring(0,ss) + to_insert + val.substring(ss)
	this.setSelectionRange(ss, ss+to_insert.length, 'backward')
	if (options.length>1) {
            line = val.substring(0,ss).split('\n').length - 1;
            annots[line].empty()
		.css('z-index','1')
		.css('white-space','normal');
            $('<div>').text(options.join('\n'))
		.css('background','#aaa')
		.css('border-radius','3px')
		.css('white-space', 'pre-line')
		.appendTo(annots[line]);
	}
    });

    async function read(url) {
	let ifr = $(`<iframe src=${url}></iframe>`).css({display:'none'}).appendTo($('body'));
	let ev=(await new Promise( res => ifr.on('load',res) ));
	let txt = ifr[0].contentWindow.document.body.innerText;
	// console.log(txt);
	ifr.remove();
	return txt;
    }

    for (let i of programs) {
	$(`<option value="${i}">${i.replace(/_/g,' ')} ${taglines[i]||''}</option>`)
	    .appendTo($('#programs'));
    }

    async function loadClick(ev) {
	let pick = $('#programs')[0].value;
	let url = `../lists/${pick}.list`;
	console.log('fetching ',pick,url)
	$('#content').val(await read(url)).trigger('keyup',{});
    }
    $('#loadbtn').on('click', loadClick);

    async function autoSlideClick(ev) {
	let slides = [];
	let loading = $('<h1>Loading</h1>').css({position:'absolute',top:'40vh',margin:'auto'})
	    .appendTo($('body'));
	let lines = $('#content').val().split('\n');
	for (let line of lines) {
	    let item;
	    let more;
	    if (line.indexOf(':') == -1) {
		item = line.trim();
		more = ''
	    } else {
		item = line.substr(0,line.indexOf(':')).trim();
		more = line.substr(line.indexOf(':')+1).trim();
	    }
	    console.log({line,item,more});
	    if (item.startsWith('#')) {
		slides.push({type:'section', 'title':item.replace(/#+ */,'')});
	    } else if (item.trim() == '' || item.startsWith('{')) {
		continue;
	    } else if (item in content) {
		if (content[item][2] == '[speech]') {
		    slides.push({type:'text', title:content[item][0], link:item, specifier:more});
		} else {
		    let lyrics = (await read(`../songs/${item}/gen/${item}-lyrics.txt`)).split('\n');
		    let readme = (await read(`../songs/${item}/README.md`)).replace(/\n/g, ' ');
		    let youtube = null;
		    let mp3 = null;
		    let bandcamp = null;

		    if (more) {
			youtube = more.match(/https:\/\/www.youtube.com\/watch\?.*v=([a-zA-Z0-9_-]*)/);
			if (youtube) youtube = youtube[1];
			else mp3 = more;
		    } else {
			youtube = readme.match(/\[(?!Bayesian Choir Performance)[^]]*\]\(https:\/\/www.youtube.com\/watch\?.*v=([a-zA-Z0-9_-]*)\)/);
			console.log({item,readme,youtube});
			if (youtube) {
			    youtube = youtube[1];
			    console.log(item,'has youtube',youtube)
			} else {
			    mp3 = readme.match(/\((https?:\/\/[^)]*\.mp3)\)/);
			    if (mp3) mp3 = mp3[1];
			    console.log(item,'has mp3',mp3)
			}
			if ( ! youtube) {
			    for (let album of bcAlbums) {
				if (item in album.tracks) {
				    bandcamp={album:album.album, track:album.tracks[item]};
				    mp3=null;
				    break;
				}
			    }
			}
			if ( ! youtube && ! mp3 && ! bandcamp && item in recordings) {
			    mp3 = `/songs/${item}/${recordings[item]}`;
			}
		    }
		    slides.push({type:'song', title:content[item][0], lyrics, bandcamp, youtube, mp3});
		}
	    } else {
		slides.push({type:'section', title:`?? ${item} ??`});
	    }
	    loading[0].innerText += '. ';
	}
	loading.remove();
	startShow(slides);
    }
    $('#autoslide').on('click', autoSlideClick);

    async function initFromUrl() {
	let hashpieces = window.location.hash.replace('#','').split('&');
	$('#programs')[0].value = hashpieces[0];
	if ($('#programs')[0].value == hashpieces[0]) {
	    await loadClick();
	}
	if (hashpieces.length>1 && hashpieces[1]=='autoslides') {
	    await autoSlideClick();
	}
    }

    if (window.location.hash) {
	initFromUrl();
    }
});
