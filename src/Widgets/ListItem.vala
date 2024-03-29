/* ListItem.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/ListItem.ui")]
    public class ListItem : Gtk.ListBoxRow {
        [GtkChild] unowned Gtk.Image icon;
        [GtkChild] unowned Gtk.Label title_label;
        [GtkChild] unowned Gtk.Label number_label;

        public string icon_name { get; set; default = "face-cool-symbolic"; }
        public string title { get; set; }
        public uint task_number { get; set; default = 0; }
        public uint stack_page { get; set; }

        public ListItem (string user_title) {
            Object (
                title: user_title
            );
        }

        public ListItem.with_icon (string user_title, string user_icon) {
            Object (
                title: user_title,
                icon_name: user_icon
            );
        }

        construct {
            icon.bind_property ("icon-name",
                this, "icon-name",
                SYNC_CREATE | BIDIRECTIONAL
            );

            title_label.bind_property ("label",
                this, "title",
                SYNC_CREATE | BIDIRECTIONAL
            );

            notify["task-number"].connect ((s, p) => {
                number_label.set_label (task_number.to_string ());
            });

            task_number = task_number;
        }
    }
}
