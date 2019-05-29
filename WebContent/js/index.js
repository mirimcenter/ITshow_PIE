const slide = _ => {
	  const wrap = one('.slide')
	  const target = wrap.children[0]
	  const len = target.children.length
	  const liStyle = `
	    position:absolute;
	    left:0;right:0;top:0;bottom:0;transition:1s;opacity:0
	  `
	  target.style.cssText = `position:relative;`
	  Array.from(target.children)
	  .forEach(ele => ele.style.cssText = liStyle)
	  target.children[0].style.opacity = 1
	  let pos = 0
	  setInterval(_ => {
	    target.children[pos].style.opacity = 0
	    pos = (pos + 1) % len 
	    target.children[pos].style.opacity = 1
	  }, 1500)
}