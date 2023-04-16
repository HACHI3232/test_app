document.addEventListener("DOMContentLoaded", function () {
	var select = document.querySelector('select[name="sort_order"]');

	select.addEventListener("change", function () {
		var selected_value = select.value;

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
});
