var decision = {
	"UserId": $.usertasks.usertask2.last.processor,
	"Role": "Local Manager",
	"Action": $.usertasks.usertask2.last.decision,
	"Comment": $.context.comment
};

$.context.History.push(decision);
$.context.comment = "";

$.context.decision = $.usertasks.usertask2.last.decision;