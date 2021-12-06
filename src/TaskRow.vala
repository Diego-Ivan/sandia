namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/TaskRow.ui")]
    public class TaskRow : Gtk.ListBoxRow {
        [GtkChild] unowned Gtk.Label title_label;
        [GtkChild] unowned Gtk.CheckButton task_check;

        public string title { get; set; }
        public bool completed { get; set; }

        public TaskRow (string user_title) {
            Object (
                title: user_title,
                css_name: "taskrow"
            );
        }

        construct {
            title_label.bind_property ("label",
                this, "title",
                BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL
            );

            task_check.bind_property ("active",
                this, "completed",
                BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL
            );

            notify["completed"].connect (() => {
                if (completed)
                    add_css_class ("completed");
                else
                    remove_css_class ("completed");
            });
        }
    }
}
