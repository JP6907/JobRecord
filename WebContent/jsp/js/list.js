
/**
 * 修改当前页码，调用后台重新查询
 */
function changeCurrentPage(currentPage) {
	$("#currentPage").val(currentPage);
	$("#mainForm").submit();
}
/**
 * 发布公告
 * @param basePath
 */
function publicAnnouncement(basePath) {
	$("#publicAnnouncementForm").attr("action",basePath + "publicAnnouncement.action");
	$("#publicAnnouncementForm").submit();
}
/**
 * 修改公告
 * @param basePath
 */
function fixCompany(basePath) {
	window.location.href=basePath + "company/modifyCompanySubmit";
	//$("#fixCompanyForm").attr("action",basePath + "company/modifyCompanySubmit.action");
	$("#fixCompanyForm").submit();
}
/**
 * 批量删除公告
 * @param basePath
 */
function deleteBatch(basePath) {
	$("#announcementListForm").attr("action",basePath + "deleteBatch.action");
	$("#announcementListForm").submit();
}