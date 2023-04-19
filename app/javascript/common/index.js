document.addEventListener("DOMContentLoaded", function () {
	var order_select = document.querySelector('select[name="sort_order"]');
	var category_select = document.querySelector('select[name="category_id"]');


	order_select.addEventListener("change", function () {
		var selected_value = order_select.value;

		var xhr = new XMLHttpRequest();
		xhr.responseType = "document";
		xhr.open("GET", "/posts?sort_order=" + selected_value, true);
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
	});

	category_select.addEventListener("change", function () {
		var selected_value = category_select.value;

		var xhr = new XMLHttpRequest();
		xhr.responseType = "document";
		xhr.open("GET", "/posts?category_id=" + selected_value, true);
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
	})

	
});
