/*
*
* jRails visual effects stubs
* version 0.2
* <aaron@ennerchi.com> | http://www.ennerchi.com
*
*/

(function($) {
	$.fn.extend({
		visualEffect : function(o, options) {
			if (options) {
        speed = options.duration * 1000;
      } else {
        speed = null;
      }
			e = o.replace(/\_(.)/g, function(m, l){return l.toUpperCase()});
			return eval('$(this).'+e+'('+ speed + ')');
		},
		appear : function(speed, callback) {
			return this.fadeIn(speed, callback);
		},
		blindDown : function(speed, callback) {
			return this.show('blind', { direction: 'vertical' }, speed, callback);
		},
		blindUp : function(speed, callback) {
			return this.hide('blind', { direction: 'vertical' }, speed, callback);
		},
		blindRight : function(speed, callback) {
			return this.show('blind', { direction: 'horizontal' }, speed, callback);
		},
		blindLeft : function(speed, callback) {
			this.hide('blind', { direction: 'horizontal' }, speed, callback);
			return this;
		},
		dropOut : function(speed, callback) {
			return this.hide('drop', {direction: 'down' }, speed, callback);
		},
		dropIn : function(speed, callback) {
			return this.show('drop', { direction: 'up' }, speed, callback);
		},
		fade : function(speed, callback) {
			return this.fadeOut(speed, callback);
		},
		fadeToggle : function(speed, callback) {
			return this.animate({opacity: 'toggle'}, speed, callback);
		},
		fold : function(speed, callback) {
			return this.hide('fold', {}, speed, callback);
		},
		foldOut : function(speed, callback) {
			return this.show('fold', {}, speed, callback);
		},
		grow : function(speed, callback) {
			return this.show('scale', {}, speed, callback);
		},
		highlight : function(speed, callback) {
			return this.show('highlight', {}, speed, callback);
		},
		puff : function(speed, callback) {
			return this.hide('puff', {}, speed, callback);
		},
		pulsate : function(speed, callback) {
			return this.show('pulsate', {}, speed, callback);
		},
		shake : function(speed, callback) {
			return this.show('shake', {}, speed, callback);
		},
		shrink : function(speed, callback) {
			return this.hide('scale', {}, speed, callback);
		},
		squish : function(speed, callback) {
			return this.hide('scale', { origin: ['top', 'left'] }, speed, callback);
		},
		slideUp : function(speed, callback) {
			return this.hide('slide', { direction: 'up'}, speed, callback);
		},
		slideDown : function(speed, callback) {
			return this.show('slide', { direction: 'up'}, speed, callback);
		},
		switchOff : function(speed, callback) {
			return this.hide('clip', {}, speed, callback);
		},
		switchOn : function(speed, callback) {
			return this.show('clip', {}, speed, callback);
		}
	});
})(jQuery);
