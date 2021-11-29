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

        public MainWindow (Application app) {
            Object (
                application: app
            );
        }

        [GtkCallback]
        void send_toast_button_clicked_cb () {
            var toast = new Adw.Toast ("My Notification");
            toast_overlay.add_toast (toast);
        }
    }
}
