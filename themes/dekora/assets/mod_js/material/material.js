/**
 * material-design-lite - Material Design Components in CSS, JS and HTML
 * @version v1.3.0
 * @license Apache-2.0
 * @copyright 2015 Google, Inc.
 * @link https://github.com/google/material-design-lite
 */
! function() {
    "use strict";

    function e(e, t) {
        if (e) {
            if (t.element_.classList.contains(t.CssClasses_.MDL_JS_RIPPLE_EFFECT)) {
                var s = document.createElement("span");
                s.classList.add(t.CssClasses_.MDL_RIPPLE_CONTAINER), s.classList.add(t.CssClasses_.MDL_JS_RIPPLE_EFFECT);
                var i = document.createElement("span");
                i.classList.add(t.CssClasses_.MDL_RIPPLE), s.appendChild(i), e.appendChild(s)
            }
            e.addEventListener("click", function(s) {
                if ("#" === e.getAttribute("href").charAt(0)) {
                    s.preventDefault();
                    var i = e.href.split("#")[1],
                        n = t.element_.querySelector("#" + i);
                    t.resetTabState_(), t.resetPanelState_(), e.classList.add(t.CssClasses_.ACTIVE_CLASS), n.classList.add(t.CssClasses_.ACTIVE_CLASS)
                }
            })
        }
    }

    function t(e, t, s, i) {
        function n() {
            var n = e.href.split("#")[1],
                a = i.content_.querySelector("#" + n);
            i.resetTabState_(t), i.resetPanelState_(s), e.classList.add(i.CssClasses_.IS_ACTIVE), a.classList.add(i.CssClasses_.IS_ACTIVE)
        }
        if (i.tabBar_.classList.contains(i.CssClasses_.JS_RIPPLE_EFFECT)) {
            var a = document.createElement("span");
            a.classList.add(i.CssClasses_.RIPPLE_CONTAINER), a.classList.add(i.CssClasses_.JS_RIPPLE_EFFECT);
            var l = document.createElement("span");
            l.classList.add(i.CssClasses_.RIPPLE), a.appendChild(l), e.appendChild(a)
        }
        i.tabBar_.classList.contains(i.CssClasses_.TAB_MANUAL_SWITCH) || e.addEventListener("click", function(t) {
            "#" === e.getAttribute("href").charAt(0) && (t.preventDefault(), n())
        }), e.show = n
    }
    var s = {
        upgradeDom: function(e, t) {},
        upgradeElement: function(e, t) {},
        upgradeElements: function(e) {},
        upgradeAllRegistered: function() {},
        registerUpgradedCallback: function(e, t) {},
        register: function(e) {},
        downgradeElements: function(e) {}
    };
    s = function() {
        function e(e, t) {
            for (var s = 0; s < c.length; s++)
                if (c[s].className === e) return "undefined" != typeof t && (c[s] = t), c[s];
            return !1
        }

        function t(e) {
            var t = e.getAttribute("data-upgraded");
            return null === t ? [""] : t.split(",")
        }

        function s(e, s) {
            var i = t(e);
            return i.indexOf(s) !== -1
        }

        function i(e, t, s) {
            if ("CustomEvent" in window && "function" == typeof window.CustomEvent) return new CustomEvent(e, {
                bubbles: t,
                cancelable: s
            });
            var i = document.createEvent("Events");
            return i.initEvent(e, t, s), i
        }

        function n(t, s) {
            if ("undefined" == typeof t && "undefined" == typeof s)
                for (var i = 0; i < c.length; i++) n(c[i].className, c[i].cssClass);
            else {
                var l = t;
                if ("undefined" == typeof s) {
                    var o = e(l);
                    o && (s = o.cssClass)
                }
                for (var r = document.querySelectorAll("." + s), _ = 0; _ < r.length; _++) a(r[_], l)
            }
        }

        function a(n, a) {
            if (!("object" == typeof n && n instanceof Element)) throw new Error("Invalid argument provided to upgrade MDL element.");
            var l = i("mdl-componentupgrading", !0, !0);
            if (n.dispatchEvent(l), !l.defaultPrevented) {
                var o = t(n),
                    r = [];
                if (a) s(n, a) || r.push(e(a));
                else {
                    var _ = n.classList;
                    c.forEach(function(e) {
                        _.contains(e.cssClass) && r.indexOf(e) === -1 && !s(n, e.className) && r.push(e)
                    })
                }
                for (var d, h = 0, u = r.length; h < u; h++) {
                    if (d = r[h], !d) throw new Error("Unable to find a registered component for the given class.");
                    o.push(d.className), n.setAttribute("data-upgraded", o.join(","));
                    var E = new d.classConstructor(n);
                    E[C] = d, p.push(E);
                    for (var m = 0, L = d.callbacks.length; m < L; m++) d.callbacks[m](n);
                    d.widget && (n[d.className] = E);
                    var I = i("mdl-componentupgraded", !0, !1);
                    n.dispatchEvent(I)
                }
            }
        }

        function l(e) {
            Array.isArray(e) || (e = e instanceof Element ? [e] : Array.prototype.slice.call(e));
            for (var t, s = 0, i = e.length; s < i; s++) t = e[s], t instanceof HTMLElement && (a(t), t.children.length > 0 && l(t.children))
        }

        function o(t) {
            var s = "undefined" == typeof t.widget && "undefined" == typeof t.widget,
                i = !0;
            s || (i = t.widget || t.widget);
            var n = {
                classConstructor: t.constructor || t.constructor,
                className: t.classAsString || t.classAsString,
                cssClass: t.cssClass || t.cssClass,
                widget: i,
                callbacks: []
            };
            if (c.forEach(function(e) {
                    if (e.cssClass === n.cssClass) throw new Error("The provided cssClass has already been registered: " + e.cssClass);
                    if (e.className === n.className) throw new Error("The provided className has already been registered")
                }), t.constructor.prototype.hasOwnProperty(C)) throw new Error("MDL component classes must not have " + C + " defined as a property.");
            var a = e(t.classAsString, n);
            a || c.push(n)
        }

        function r(t, s) {
            var i = e(t);
            i && i.callbacks.push(s)
        }

        function _() {
            for (var e = 0; e < c.length; e++) n(c[e].className)
        }

        function d(e) {
            if (e) {
                var t = p.indexOf(e);
                p.splice(t, 1);
                var s = e.element_.getAttribute("data-upgraded").split(","),
                    n = s.indexOf(e[C].classAsString);
                s.splice(n, 1), e.element_.setAttribute("data-upgraded", s.join(","));
                var a = i("mdl-componentdowngraded", !0, !1);
                e.element_.dispatchEvent(a)
            }
        }

        function h(e) {
            var t = function(e) {
                p.filter(function(t) {
                    return t.element_ === e
                }).forEach(d)
            };
            if (e instanceof Array || e instanceof NodeList)
                for (var s = 0; s < e.length; s++) t(e[s]);
            else {
                if (!(e instanceof Node)) throw new Error("Invalid argument provided to downgrade MDL nodes.");
                t(e)
            }
        }
        var c = [],
            p = [],
            C = "mdlComponentConfigInternal_";
        return {
            upgradeDom: n,
            upgradeElement: a,
            upgradeElements: l,
            upgradeAllRegistered: _,
            registerUpgradedCallback: r,
            register: o,
            downgradeElements: h
        }
    }(), s.ComponentConfigPublic, s.ComponentConfig, s.Component, s.upgradeDom = s.upgradeDom, s.upgradeElement = s.upgradeElement, s.upgradeElements = s.upgradeElements, s.upgradeAllRegistered = s.upgradeAllRegistered, s.registerUpgradedCallback = s.registerUpgradedCallback, s.register = s.register, s.downgradeElements = s.downgradeElements, window.componentHandler = s, window.componentHandler = s, window.addEventListener("load", function() {
        "classList" in document.createElement("div") && "querySelector" in document && "addEventListener" in window && Array.prototype.forEach ? (document.documentElement.classList.add("mdl-js"), s.upgradeAllRegistered()) : (s.upgradeElement = function() {}, s.register = function() {})
    }), Date.now || (Date.now = function() {
        return (new Date).getTime()
    }, Date.now = Date.now);
	
    for (var i = ["webkit", "moz"], n = 0; n < i.length && !window.requestAnimationFrame; ++n) {
        var a = i[n];
        window.requestAnimationFrame = window[a + "RequestAnimationFrame"], window.cancelAnimationFrame = window[a + "CancelAnimationFrame"] || window[a + "CancelRequestAnimationFrame"], window.requestAnimationFrame = window.requestAnimationFrame, window.cancelAnimationFrame = window.cancelAnimationFrame
    }
    if (/iP(ad|hone|od).*OS 6/.test(window.navigator.userAgent) || !window.requestAnimationFrame || !window.cancelAnimationFrame) {
        var l = 0;
        window.requestAnimationFrame = function(e) {
            var t = Date.now(),
                s = Math.max(l + 16, t);
            return setTimeout(function() {
                e(l = s)
            }, s - t)
        }, window.cancelAnimationFrame = clearTimeout, window.requestAnimationFrame = window.requestAnimationFrame, window.cancelAnimationFrame = window.cancelAnimationFrame
    }
    var o = function(e) {
        this.element_ = e, this.init()
    };
    window.MaterialButton = o, o.prototype.Constant_ = {}, o.prototype.CssClasses_ = {
        RIPPLE_EFFECT: "mdl-js-ripple-effect",
        RIPPLE_CONTAINER: "mdl-button__ripple-container",
        RIPPLE: "mdl-ripple"
    }, o.prototype.blurHandler_ = function(e) {
        e && this.element_.blur()
    }, o.prototype.disable = function() {
        this.element_.disabled = !0
    }, o.prototype.disable = o.prototype.disable, o.prototype.enable = function() {
        this.element_.disabled = !1
    }, o.prototype.enable = o.prototype.enable, o.prototype.init = function() {
        if (this.element_) {
            if (this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT)) {
                var e = document.createElement("span");
                e.classList.add(this.CssClasses_.RIPPLE_CONTAINER), this.rippleElement_ = document.createElement("span"), this.rippleElement_.classList.add(this.CssClasses_.RIPPLE), e.appendChild(this.rippleElement_), this.boundRippleBlurHandler = this.blurHandler_.bind(this), this.rippleElement_.addEventListener("mouseup", this.boundRippleBlurHandler), this.element_.appendChild(e)
            }
            this.boundButtonBlurHandler = this.blurHandler_.bind(this), this.element_.addEventListener("mouseup", this.boundButtonBlurHandler), this.element_.addEventListener("mouseleave", this.boundButtonBlurHandler)
        }
    }, s.register({
        constructor: o,
        classAsString: "MaterialButton",
        cssClass: "mdl-js-button",
        widget: !0
    }); 
    var L = function(e) {
        this.element_ = e, this.maxRows = this.Constant_.NO_MAX_ROWS, this.init()
    };
    window.MaterialTextfield = L, L.prototype.Constant_ = {
        NO_MAX_ROWS: -1,
        MAX_ROWS_ATTRIBUTE: "maxrows"
    }, L.prototype.CssClasses_ = {
        LABEL: "mdl-textfield__label",
        INPUT: "mdl-textfield__input",
        IS_DIRTY: "is-dirty",
        IS_FOCUSED: "is-focused",
        IS_DISABLED: "is-disabled",
        IS_INVALID: "is-invalid",
        IS_UPGRADED: "is-upgraded",
        HAS_PLACEHOLDER: "has-placeholder"
    }, L.prototype.onKeyDown_ = function(e) {
        var t = e.target.value.split("\n").length;
        13 === e.keyCode && t >= this.maxRows && e.preventDefault()
    }, L.prototype.onFocus_ = function(e) {
        this.element_.classList.add(this.CssClasses_.IS_FOCUSED)
    }, L.prototype.onBlur_ = function(e) {
        this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
    }, L.prototype.onReset_ = function(e) {
        this.updateClasses_()
    }, L.prototype.updateClasses_ = function() {
        this.checkDisabled(), this.checkValidity(), this.checkDirty(), this.checkFocus()
    }, L.prototype.checkDisabled = function() {
        this.input_.disabled ? this.element_.classList.add(this.CssClasses_.IS_DISABLED) : this.element_.classList.remove(this.CssClasses_.IS_DISABLED)
    }, L.prototype.checkDisabled = L.prototype.checkDisabled, L.prototype.checkFocus = function() {
        Boolean(this.element_.querySelector(":focus")) ? this.element_.classList.add(this.CssClasses_.IS_FOCUSED) : this.element_.classList.remove(this.CssClasses_.IS_FOCUSED)
    }, L.prototype.checkFocus = L.prototype.checkFocus, L.prototype.checkValidity = function() {
        this.input_.validity && (this.input_.validity.valid ? this.element_.classList.remove(this.CssClasses_.IS_INVALID) : this.element_.classList.add(this.CssClasses_.IS_INVALID))
    }, L.prototype.checkValidity = L.prototype.checkValidity, L.prototype.checkDirty = function() {
        this.input_.value && this.input_.value.length > 0 ? this.element_.classList.add(this.CssClasses_.IS_DIRTY) : this.element_.classList.remove(this.CssClasses_.IS_DIRTY)
    }, L.prototype.checkDirty = L.prototype.checkDirty, L.prototype.disable = function() {
        this.input_.disabled = !0, this.updateClasses_()
    }, L.prototype.disable = L.prototype.disable, L.prototype.enable = function() {
        this.input_.disabled = !1, this.updateClasses_()
    }, L.prototype.enable = L.prototype.enable, L.prototype.change = function(e) {
        this.input_.value = e || "", this.updateClasses_()
    }, L.prototype.change = L.prototype.change, L.prototype.init = function() {
        if (this.element_ && (this.label_ = this.element_.querySelector("." + this.CssClasses_.LABEL), this.input_ = this.element_.querySelector("." + this.CssClasses_.INPUT), this.input_)) {
            this.input_.hasAttribute(this.Constant_.MAX_ROWS_ATTRIBUTE) && (this.maxRows = parseInt(this.input_.getAttribute(this.Constant_.MAX_ROWS_ATTRIBUTE), 10), isNaN(this.maxRows) && (this.maxRows = this.Constant_.NO_MAX_ROWS)), this.input_.hasAttribute("placeholder") && this.element_.classList.add(this.CssClasses_.HAS_PLACEHOLDER), this.boundUpdateClassesHandler = this.updateClasses_.bind(this), this.boundFocusHandler = this.onFocus_.bind(this), this.boundBlurHandler = this.onBlur_.bind(this), this.boundResetHandler = this.onReset_.bind(this), this.input_.addEventListener("input", this.boundUpdateClassesHandler), this.input_.addEventListener("focus", this.boundFocusHandler), this.input_.addEventListener("blur", this.boundBlurHandler), this.input_.addEventListener("reset", this.boundResetHandler), this.maxRows !== this.Constant_.NO_MAX_ROWS && (this.boundKeyDownHandler = this.onKeyDown_.bind(this), this.input_.addEventListener("keydown", this.boundKeyDownHandler));
            var e = this.element_.classList.contains(this.CssClasses_.IS_INVALID);
            this.updateClasses_(), this.element_.classList.add(this.CssClasses_.IS_UPGRADED), e && this.element_.classList.add(this.CssClasses_.IS_INVALID), this.input_.hasAttribute("autofocus") && (this.element_.focus(), this.checkFocus())
        }
    }, s.register({
        constructor: L,
        classAsString: "MaterialTextfield",
        cssClass: "mdl-js-textfield",
        widget: !0
    });
    
    var S = function(e) {
        this.element_ = e, this.init()
    };
    window.MaterialRipple = S, S.prototype.Constant_ = {
        INITIAL_SCALE: "scale(0.0001, 0.0001)",
        INITIAL_SIZE: "1px",
        INITIAL_OPACITY: "0.4",
        FINAL_OPACITY: "0",
        FINAL_SCALE: ""
    }, S.prototype.CssClasses_ = {
        RIPPLE_CENTER: "mdl-ripple--center",
        RIPPLE_EFFECT_IGNORE_EVENTS: "mdl-js-ripple-effect--ignore-events",
        RIPPLE: "mdl-ripple",
        IS_ANIMATING: "is-animating",
        IS_VISIBLE: "is-visible"
    }, S.prototype.downHandler_ = function(e) {
        if (!this.rippleElement_.style.width && !this.rippleElement_.style.height) {
            var t = this.element_.getBoundingClientRect();
            this.boundHeight = t.height, this.boundWidth = t.width, this.rippleSize_ = 2 * Math.sqrt(t.width * t.width + t.height * t.height) + 2, this.rippleElement_.style.width = this.rippleSize_ + "px", this.rippleElement_.style.height = this.rippleSize_ + "px"
        }
        if (this.rippleElement_.classList.add(this.CssClasses_.IS_VISIBLE), "mousedown" === e.type && this.ignoringMouseDown_) this.ignoringMouseDown_ = !1;
        else {
            "touchstart" === e.type && (this.ignoringMouseDown_ = !0);
            var s = this.getFrameCount();
            if (s > 0) return;
            this.setFrameCount(1);
            var i, n, a = e.currentTarget.getBoundingClientRect();
            if (0 === e.clientX && 0 === e.clientY) i = Math.round(a.width / 2), n = Math.round(a.height / 2);
            else {
                var l = void 0 !== e.clientX ? e.clientX : e.touches[0].clientX,
                    o = void 0 !== e.clientY ? e.clientY : e.touches[0].clientY;
                i = Math.round(l - a.left), n = Math.round(o - a.top)
            }
            this.setRippleXY(i, n), this.setRippleStyles(!0), window.requestAnimationFrame(this.animFrameHandler.bind(this))
        }
    }, S.prototype.upHandler_ = function(e) {
        e && 2 !== e.detail && window.setTimeout(function() {
            this.rippleElement_.classList.remove(this.CssClasses_.IS_VISIBLE)
        }.bind(this), 0)
    }, S.prototype.init = function() {
        if (this.element_) {
            var e = this.element_.classList.contains(this.CssClasses_.RIPPLE_CENTER);
            this.element_.classList.contains(this.CssClasses_.RIPPLE_EFFECT_IGNORE_EVENTS) || (this.rippleElement_ = this.element_.querySelector("." + this.CssClasses_.RIPPLE), this.frameCount_ = 0, this.rippleSize_ = 0, this.x_ = 0, this.y_ = 0, this.ignoringMouseDown_ = !1, this.boundDownHandler = this.downHandler_.bind(this), this.element_.addEventListener("mousedown", this.boundDownHandler), this.element_.addEventListener("touchstart", this.boundDownHandler), this.boundUpHandler = this.upHandler_.bind(this), this.element_.addEventListener("mouseup", this.boundUpHandler), this.element_.addEventListener("mouseleave", this.boundUpHandler), this.element_.addEventListener("touchend", this.boundUpHandler), this.element_.addEventListener("blur", this.boundUpHandler), this.getFrameCount = function() {
                return this.frameCount_
            }, this.setFrameCount = function(e) {
                this.frameCount_ = e
            }, this.getRippleElement = function() {
                return this.rippleElement_
            }, this.setRippleXY = function(e, t) {
                this.x_ = e, this.y_ = t
            }, this.setRippleStyles = function(t) {
                if (null !== this.rippleElement_) {
                    var s, i, n, a = "translate(" + this.x_ + "px, " + this.y_ + "px)";
                    t ? (i = this.Constant_.INITIAL_SCALE, n = this.Constant_.INITIAL_SIZE) : (i = this.Constant_.FINAL_SCALE, n = this.rippleSize_ + "px", e && (a = "translate(" + this.boundWidth / 2 + "px, " + this.boundHeight / 2 + "px)")), s = "translate(-50%, -50%) " + a + i, this.rippleElement_.style.webkitTransform = s, this.rippleElement_.style.msTransform = s, this.rippleElement_.style.transform = s, t ? this.rippleElement_.classList.remove(this.CssClasses_.IS_ANIMATING) : this.rippleElement_.classList.add(this.CssClasses_.IS_ANIMATING)
                }
            }, this.animFrameHandler = function() {
                this.frameCount_-- > 0 ? window.requestAnimationFrame(this.animFrameHandler.bind(this)) : this.setRippleStyles(!1)
            })
        }
    }, s.register({
        constructor: S,
        classAsString: "MaterialRipple",
        cssClass: "mdl-js-ripple-effect",
        widget: !1
    });
	
}();
