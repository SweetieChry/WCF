{if $mimeType === 'text/plain'}
{capture assign='content'}{lang}wcf.user.register.needActivation.mail.plaintext{/lang}{/capture}
{include file='email_plaintext'}
{else}
	{capture assign='content'}
	<h2>{lang}wcf.user.register.needActivation.mail.html.headline{/lang}</h2>
	{lang}wcf.user.register.needActivation.mail.html.intro{/lang}

	{capture assign=button}
	<a href="{link controller='RegisterActivation' isEmail=true}u={@$mailbox->getUser()->userID}&a={@$mailbox->getUser()->activationCode}{/link}">
		{lang}wcf.user.register.needActivation.mail.html.activate{/lang}
	</a>
	{/capture}
	{include file='email_paddingHelper' class='button' content=$button sandbox=true}

	{lang}wcf.user.register.needActivation.mail.html.outro{/lang}
	{/capture}
	{include file='email_html'}
{/if}
