(function(){var a,b,c,d,e,f,g,h={}.hasOwnProperty,i=function(a,b){function d(){this.constructor=a}for(var c in b)h.call(b,c)&&(a[c]=b[c]);return d.prototype=b.prototype,a.prototype=new d,a.__super__=b.prototype,a};a=function(){function a(a){this.name=a}return a.prototype.move=function(a){return alert(this.name+(" moved "+a+"m"))},a}(),c=function(a){function b(){return f=b.__super__.constructor.apply(this,arguments),f}return i(b,a),b.prototype.move=function(){return alert("slithering"),b.__super__.move.call(this,5)},b}(a),b=function(a){function b(){return g=b.__super__.constructor.apply(this,arguments),g}return i(b,a),b.prototype.move=function(){return alert("Galloping..."),b.__super__.move.call(this,45)},b}(a),d=new c("Sammy the python"),e=new b("Tommy the horse"),d.move(),e.move()}).call(this)