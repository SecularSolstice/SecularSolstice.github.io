window.onload = function() {
    var is_light;
    var is_trans = false;
    
    if (window.location.search == '?transdark') { is_light=false; is_trans=true; }
    else if (window.location.search == '?translight') { is_light=true; is_trans=true; }
    else if (window.location.search == '?dark') is_light=false;
    else if (window.location.search == '?light') is_light=true;
    else if (document.cookie == 'theme=dark') is_light=false;
    else if (document.cookie == 'theme=light') is_light=true;
    else is_light=false;

    if (is_light) {
        document.getElementsByTagName('html')[0].className = 'light';
    }

    if (is_trans) {
	document.getElementsByTagName('html')[0].className += ' transparent';
    } else {
	var toggle = document.createElement('a');
	toggle.className = 'themeSwitcher';
	toggle.innerText = 'color';
	toggle.onclick = function() {
            is_light = !is_light;
            document.cookie = 'theme='+(is_light?'light':'dark')+';path=/';
            document.getElementsByTagName('html')[0].className = is_light?'light':'';
	};
	document.getElementsByTagName('body')[0].append(toggle);
    }
}
