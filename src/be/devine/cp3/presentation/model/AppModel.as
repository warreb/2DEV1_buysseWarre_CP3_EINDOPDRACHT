/**
 * Created with IntelliJ IDEA.
 * User: Warre
 * Date: 20/11/12
 * Time: 22:12
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.presentation.model
{
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher
{

    public static const PAGE_CHANGED:String = "Page_Changed";
    public static const CURRENT_PAGE_CHANGED:String = "Current_Page_Changed";

    public function AppModel()
    {

    }
}
}
