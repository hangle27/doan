
this.Element = function(elem)
{
	this.element = elem;
	this.getTop = function()
	{
		return this.element.offsetHeight;
	};
};



function relocateDialogue()
{
	dlg = document.getElementById("dialogue0");
	dialogHeight = dlg.offsetHeight;
	parentHeight = dlg.parentElement.offsetHeight;
	dlg.style.marginTop = (parentHeight - dialogHeight) / 3 + "px";
	
}
window.onload = function(e)
{
	relocateDialogue();
};
window.onresize = function(e)
{
	relocateDialogue();
}

DialogueButtons = document.getElementsByName("dialogue_button");

for( var i = 0; i < DialogueButtons.length; i++)
{
	DialogueButtons[i].onclick = function()
	{
		alert(this.title);
	};
}