const fullKeyboardLayout = {
	layout: {
		default: [
			"{escape} {f1 {f2 {f3} {f4} {f5} {f6} {f7} {f8} {f9} {f10} {f11} {f12}",
			"` 1 2 3 4 5 6 7 8 9 0 - = {backspace}",
			"{tab} q w e r t y u i o p [ ] \\",
			"{capslock} a s d f g h j k l ; ' {enter}",
			"{shiftleft} z x c v b n m , . / {shiftright}",
			"{controlleft} {altleft} {metaleft} {space} {metaright} {altright}",
		],
		shift: [
			"{escape} {f1} {f2} {f3} {f4} {f5} {f6} {f7} {f8} {f9} {f10} {f11} {f12}",
			"~ ! @ # $ % ^ & * ( ) _ + {backspace}",
			"{tab} Q W E R T Y U I O P { } |",
			'{capslock} A S D F G H J K L : " {enter}',
			"{shiftleft} Z X C V B N M < > ? {shiftright}",
			"{controlleft} {altleft} {metaleft} {space} {metaright} {altright}",
		],
	},
	display: {
		"{escape}": "esc ⎋",
		"{tab}": "tab ⇥",
		"{backspace}": "backspace ⌫",
		"{enter}": "enter ↵",
		"{capslock}": "caps lock ⇪",
		"{shiftleft}": "shift ⇧",
		"{shiftright}": "shift ⇧",
		"{controlleft}": "ctrl ⌃",
		"{controlright}": "ctrl ⌃",
		"{altleft}": "alt ⌥",
		"{altright}": "alt ⌥",
		"{metaleft}": "cmd ⌘",
		"{metaright}": "cmd ⌘",
	},
};

document.addEventListener("DOMContentLoaded", function () {
	let Keyboard = window.SimpleKeyboard.default;

	let keyboard = new Keyboard({
		onChange: (input) => onChange(input),
		onKeyPress: (button) => onKeyPress(button),
		physicalKeyboardHighlight: true,
		...fullKeyboardLayout,
	});

	document.querySelector(".input").addEventListener("input", (event) => {
		const inputValue = event.target.value;
		keyboard.setInput(inputValue);
	});

	function onChange(input) {
		document.querySelector(".input").value = input;
	}

	function onKeyPress(button) {
		console.log("Button pressed", button);

		/**
		 * If you want to handle the shift and caps lock buttons
		 */

		if (button === "{shiftleft}" || button === "{lock}") handleShift();
	}

	function handleShift() {
		let currentLayout = keyboard.options.layoutName;
		let shiftToggle = currentLayout === "default" ? "shift" : "default";

		keyboard.setOptions({
			layoutName: shiftToggle,
		});
	}
});
