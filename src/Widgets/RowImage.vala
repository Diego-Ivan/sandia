/* RowImage.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    public class RowImage : Adw.Bin {
        private Gtk.Image image;
        public string icon_name { get; set; }
        public Gtk.GestureClick click_controller { get; set; }

        public signal void clicked ();

        public RowImage (string icon) {
            Object (
                icon_name: icon,
                css_name: "rowimage"
            );
        }

        public void add_destructive_action_class () {
            image.add_css_class ("destructive-action");
        }

        construct {
            image = new Gtk.Image ();
            image.bind_property ("icon-name",
                this, "icon-name",
                BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL
            );

            click_controller = new Gtk.GestureClick ();

            click_controller.released.connect (() => {
                clicked ();
            });

            add_controller (click_controller);
            set_child (image);
        }
    }
}
