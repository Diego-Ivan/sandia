/* TaskPage.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/TaskPage.ui")]
    public class TaskPage : Adw.Bin {
        [GtkChild] unowned Gtk.Label title_label;
        [GtkChild] unowned Gtk.ListBox task_box;
        [GtkChild] unowned Gtk.Entry task_entry;

        public string title { get; set; }
        public string named { get; set; }
        public TaskList list { get; set; }

        public TaskPage (string user_title, string user_name) {
            Object (
                title: user_title,
                named: user_name
            );

            list = new TaskList ();
            bind_property ("title",
                list, "title",
                SYNC_CREATE | BIDIRECTIONAL
            );
        }

        construct {
            title_label.bind_property ("label",
                this, "title",
                SYNC_CREATE | BIDIRECTIONAL
            );
        }

        [GtkCallback]
        private void add_button_clicked_cb () {
            // TODO: Add a task to the Task List, not just to the UI
            if (task_entry.text != "") {
                var row = new TaskRow (task_entry.text);
                task_box.append (row);
                task_entry.text = "";
            }
        }
    }
}
