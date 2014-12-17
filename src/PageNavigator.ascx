<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageNavigator.ascx.cs" Inherits="ManageWeb.PageNavigator" %>
<script type="text/javascript" src="js/PageNavigator.js"  ></script>
<table width="100%" border="0" style="border-collapse:collapse">
    <tr>
        <td class="alphabet" align="center" valign="bottom"><script type="text/javascript">CreateNavigationPanel(currentPage, pageSize, pageCount, navigateGroupSize, baseNavigateURL, adder);</script></td>
    </tr>
</table>