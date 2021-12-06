/* MainWindow.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    [GtkTemplate (ui = "/io/github/diegoivanme/Sandia/ui/MainWindow.ui")]
    public class MainWindow : Adw.ApplicationWindow {
        [GtkChild] unowned Adw.ToastOverlay toast_overlay;
        [GtkChild] unowned Gtk.ListBox sidebar_list;
        [GtkChild] unowned Gtk.Stack main_stack;

        public MainWindow (Application app) {
            Object (
                application: app
            );

            var item = new ListItem.with_icon ("My Item", "audio-x-generic");
            sidebar_list.append (item);

            var item2 = new ListItem ("My Second Item");
            sidebar_list.append (item2);

            sidebar_list.row_selected.connect ((row) => {
                message ("Hola Mundo!");
            });

            var status = new TaskPage ("Business Management", "business_management");
            main_stack.add_titled (status, status.named, status.title);
        }
    }
}
