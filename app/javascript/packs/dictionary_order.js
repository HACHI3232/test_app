var order_select = document.querySelector('select[name="sort_order"]');
var category_select = document.querySelector('select[name="category_id"]');


function request(url, method) {
	const params = { sort_order: 'value1', sort_order: 'value2' };
	const queryString = new URLSearchParams(params).toString();
	window.history.pushState(null, null, url);

	var xhr = new XMLHttpRequest();
	xhr.responseType = "document";
	xhr.open(method, url, true);
	xhr.onload = function () {
		var html = xhr.response.documentElement.outerHTML;
		var parser = new DOMParser();
		var doc = parser.parseFromString(html, "text/html");
		var container = doc.querySelector(".contents");
		var containerHtml = container.innerHTML;
		const contentsDOM = document.getElementsByClassName("contents");
		contentsDOM[0].innerHTML = containerHtml;
	};
	xhr.send();
}

if (order_select) {
	order_select.addEventListener("change", function () {
		let url = `/posts?sort_order=${order_select.value}&category_id=${category_select.value}`;
		request(url, "GET") ;
	});
}

if (category_select) {
	category_select.addEventListener("change", function () {
		let url = `/posts?sort_order=${order_select.value}&category_id=${category_select.value}`;
		request(url, "GET") ;
	})
}

window.addEventListener('load', (event) => {

	const menuIcon = document.getElementsByClassName("menu-icon")[0];
	const mainNavigation = document.getElementsByClassName("hamburger__nav")[0];

	menuIcon.addEventListener("click",function (e) {
		if (mainNavigation.style.display == "none") {
			mainNavigation.style.display = "inline-flex";
		} else {
			mainNavigation.style.display = "none";
		}
	})

})
