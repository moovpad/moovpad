// As the MOOVPAD app uses custom session objects for managing user sessions rather than cookies or similar sessionstate methods, this function
// disables the page navigation buttons of the browser so that users do not navigate away from the entire page, instead providing the on-page nav buttons
// to move between screens. This prevents the user session objects from being reset, as these do not hold session data beyond the active session
// i.e. this prevents any kind of advertising or session tracking from within the MOOVPAD app, for user security and privacy).
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);

// The MOOVPAD web app is designed to be displayed and resized for varying display sizes, ranging from desktop through to small smartphones. This function
// how the display size is et in the index.html file, and is done similarly in the Index.razor file. This allows both sets of functions (C# and JS) to access
// current screensize easily for window resize or orientation changes.
function DisplaySize() {
    var w = window.innerWidth;
    var h = window.innerHeight;
    if (w < 680) displaySize = 3;
    else if (w >= 680 && w < 800) displaySize = 2;
    else if (w >= 800 && w <= 1280) displaySize = 1;
    else displaySize = 0;
}

// The function below is used to call on a task in the Index.razor file called WindowResized, which then alters the formatting of the frontend to suit the needs
// of the particular screen size. Information from this function and the above DisplaySize() function both support FormatScreen() tasks throughout the MOOVPAD UI
// and enable the responsive changes necessary.
function BodyResized() {
    if (dotNetHelper == null) return;
    dotNetHelper.invokeMethodAsync("WindowResized", window.innerWidth, window.innerHeight);
}

// This function calls on a task in the Index.razor page called MouseDown, which triggers a cyclic check of the mouseDown boolean changes to false,
// which then terminates the desired action (e.g. counter label increasing/decreasing).
function MouseDown(id) {
    dotNetHelper.invokeMethodAsync("MouseDown");
    switch (id) {
        case "Button1":
            Button1.src = "/path/to/image";
            dotNetHelper.invokeMethodAsync("C#function");
            break;
        case "Button2":
            Button2.src = "/path/to/image";
            dotNetHelper.invokeMethodAsync("C#function");
            break;
    }
}

//This function calls on a task in the Index.razor page, which then sets mouseDown to false, which leads to the termination of the MouseDown task event.
function MouseUp(id) {
    dotNetHelper.invokeMethodAsync("MouseUp");
    switch (id) {
        case "Button1":
            Button1.src = "/path/to/image.png";
            break;
        case "Button2":
            Button2.src = "/path/to/image.png";
            break;
    }
}