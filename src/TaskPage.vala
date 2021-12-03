namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/TaskPage.ui")]
    public class TaskPage : Gtk.Box {

        public string title { get; set; }
        public string named { get; set; }

        public TaskPage (string user_title, string user_name) {
            Object (
                title: user_title,
                named: user_name
            );
        }

        construct {
        }
    }
}
