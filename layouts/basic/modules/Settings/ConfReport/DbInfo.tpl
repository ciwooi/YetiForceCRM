{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	<!-- tpl-Settings-ConfReport-DbInfo -->
	<div class="modal-body js-modal-content" data-js="click">
		<h3>
			<span class="mr-4">{\App\Language::translate('LBL_DB_TOTAL_SIZE', 'Settings::ConfReport')}: {\vtlib\Functions::showBytes($DB_INFO['size'])}</span>
			<span class="mr-4">{\App\Language::translate('LBL_DATA_TOTAL_SIZE', 'Settings::ConfReport')}: {\vtlib\Functions::showBytes($DB_INFO['dataSize'])}</span>
			<span class="mr-4">{\App\Language::translate('LBL_INDEX_TOTAL_SIZE', 'Settings::ConfReport')}: {\vtlib\Functions::showBytes($DB_INFO['indexSize'])}</span>
			{if $DB_INFO['isFileSize']}
				<span class="mr-4">{\App\Language::translate('LBL_FILE_TOTAL_SIZE', 'Settings::ConfReport')}: {\vtlib\Functions::showBytes($DB_INFO['filesSize'])}</span>
			{/if}
		</h3>
		<div class="mt-3">
			<table id="db-info-table" class="table table-sm table-striped display js-db-info-table" data-js="dataTables">
				<thead>
					<tr>
						<th>{\App\Language::translate('LBL_TABLE_NAME', 'Settings::ConfReport')}</th>
						<th>{\App\Language::translate('LBL_ROWS', 'Settings::ConfReport')}</th>
						<th>{\App\Language::translate('LBL_DATA_SIZE', 'Settings::ConfReport')}</th>
						<th>{\App\Language::translate('LBL_INDEX_SIZE', 'Settings::ConfReport')}</th>
						{if $DB_INFO['isFileSize']}
							<th>{\App\Language::translate('LBL_FILE_SIZE', 'Settings::ConfReport')}</th>
						{/if}
						<th>{\App\Language::translate('LBL_FORMAT', 'Settings::ConfReport')}</th>
						<th>{\App\Language::translate('LBL_ENGINE', 'Settings::ConfReport')}</th>
						<th>{\App\Language::translate('LBL_COLLATION', 'Settings::ConfReport')}</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$DB_INFO['tables'] key=TABLE item=ITEM}
						<tr>
							<td>{$TABLE}</td>
							<td data-order="{$ITEM['rows']}">{App\Fields\Integer::formatToDisplay($ITEM['rows'])}</td>
							<td data-order="{$ITEM['dataSize']}">{\vtlib\Functions::showBytes($ITEM['dataSize'])}</td>
							<td data-order="{$ITEM['indexSize']}">{\vtlib\Functions::showBytes($ITEM['indexSize'])}</td>
							{if $DB_INFO['isFileSize']}
								<td data-order="{$ITEM['fileSize']}">{\vtlib\Functions::showBytes($ITEM['fileSize'])}</td>
							{/if}
							<td>{$ITEM['format']}</td>
							<td>{$ITEM['engine']}</td>
							<td>{$ITEM['collation']}</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
	<!-- /tpl-Settings-ConfReport-DbInfo -->
{/strip}
