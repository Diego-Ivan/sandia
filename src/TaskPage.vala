namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/TaskPage.ui")]
    public class TaskPage : Adw.Bin {
        [GtkChild] unowned Gtk.Label title_label;

        public string title { get; set; }
        public string named { get; set; }

        public TaskPage (string user_title, string user_name) {
            Object (
                title: user_title,
                named: user_name
            );
        }

        construct {
            title_label.bind_property ("label",
                this, "title",
                BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL
            );
        }
    }
}
