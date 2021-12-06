/* TaskRow.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/TaskRow.ui")]
    public class TaskRow : Gtk.ListBoxRow {
        [GtkChild] unowned Gtk.Label title_label;
        [GtkChild] unowned Gtk.CheckButton task_check;
        [GtkChild] unowned Gtk.Box actions_box;

        public string title { get; set; }
        public bool completed { get; set; }

        public Task task { get; set; }

        public TaskRow (string user_title) {
            Object (
                title: user_title,
                css_name: "taskrow"
            );

            task = new Task ();
            bind_property ("title",
                task, "title",
                BIDIRECTIONAL
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

            var trash_image = new RowImage ("user-trash-symbolic");
            trash_image.add_css_class ("destructive-action");
            var edit_image = new RowImage ("document-edit-symbolic");

            trash_image.clicked.connect (() => {
                message ("Trash Button Clicked");
            });

            edit_image.clicked.connect (() => {
                message ("Edit Image clicked");
            });

            actions_box.append (trash_image);
            actions_box.append (edit_image);

            notify["completed"].connect (() => {
                if (completed)
                    add_css_class ("completed");
                else
                    remove_css_class ("completed");
            });
        }
    }
}
