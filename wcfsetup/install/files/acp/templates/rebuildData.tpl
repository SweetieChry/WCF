{include file='header' pageTitle='wcf.acp.rebuildData'}

<script data-relocate="true">
		$(function() {
			WCF.Language.add('wcf.acp.worker.abort.confirmMessage', '{lang}wcf.acp.worker.abort.confirmMessage{/lang}');
		});
</script>

<header class="contentHeader">
	<div class="contentHeaderTitle">
		<h1 class="contentTitle">{lang}wcf.acp.rebuildData{/lang}</h1>
	</div>
	
	{hascontent}
		<nav class="contentHeaderNavigation">
			<ul>
				{content}{event name='contentHeaderNavigation'}{/content}
			</ul>
		</nav>
	{/hascontent}
</header>

{if $showInnoDBWarning}
	<p class="warning">{lang}wcf.acp.index.innoDBWarning{/lang}</p>
{/if}

<section class="section">
	<header class="sectionHeader">
		<h2 class="sectionTitle">{lang}wcf.acp.rebuildData{/lang}</h2>
		<p class="sectionDescription">{lang}wcf.acp.rebuildData.description{/lang}</p>
	</header>
	
	{foreach from=$objectTypes item=objectType}
		{assign var=_allowRebuild value=true}
		{if !$convertEncoding && $objectType->objectType != 'com.woltlab.wcf.databaseConvertEncoding'}
			{assign var=_allowRebuild value=false}
		{/if}
		
		<dl class="wide">
			<dd>
				<a class="button small{if !$_allowRebuild} disabled{/if}" id="rebuildData{@$objectType->objectTypeID}">{lang}wcf.acp.rebuildData.{@$objectType->objectType}{/lang}</a>
				<small>{lang}wcf.acp.rebuildData.{@$objectType->objectType}.description{/lang}</small>
				
				{if $_allowRebuild}
					<script data-relocate="true">
						$(function() {
							$('#rebuildData{@$objectType->objectTypeID}').click(function () {
								new WCF.ACP.Worker('cache', '{@$objectType->className|encodeJS}', '{lang}wcf.acp.rebuildData.{@$objectType->objectType}{/lang}');
							});
						});
					</script>
				{/if}
			</dd>
		</dl>
	{/foreach}
</section>

<footer class="contentFooter">
	{hascontent}
		<nav class="contentFooterNavigation">
			<ul>
				{content}{event name='contentFooterNavigation'}{/content}
			</ul>
		</nav>
	{/hascontent}
</footer>

{include file='footer'}
