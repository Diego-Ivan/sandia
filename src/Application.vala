/* Application.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    public class Application : Adw.Application {
        public MainWindow main_window;

        struct AccelEntry {
            string action_name;
            string[] accels;
        }

        static ActionEntry[] ACTION_ENTRIES = {
            { "quit", quit },
            { "about", show_about_dialog}
        };

        static AccelEntry[] ACCEL_ENTRIES = {
            { "app.quit", {"<Ctrl>q"} },
            { "window.close", {"<Ctrl>w"} }
        };

        public Application () {
            Object (
                flags: ApplicationFlags.FLAGS_NONE,
                application_id: Config.APP_ID
            );
        }

        protected override void startup () {
            base.startup ();

            add_action_entries (ACTION_ENTRIES, this);

            foreach (var accel in ACCEL_ENTRIES)
                set_accels_for_action (accel.action_name, accel.accels);
        }

        protected override void activate () {
            if (main_window == null) {
                main_window = new MainWindow (this);
            }
            main_window.present ();
        }

        private void show_about_dialog () {
            const string COPYRIGHT = "Copyright \xc2\xa9 2021 Diego Iván";
            const string? AUTHORS[] = {
                "Diego Iván",
                null
            };
            string program_name = "Sandia";

            Gtk.show_about_dialog (
                main_window, // transient for
                "program_name", program_name,
                "logo-icon-name", Config.APP_ID,
                "version", Config.VERSION,
                "copyright", COPYRIGHT,
                "authors", AUTHORS,
                "artists", null,
                "license-type", Gtk.License.GPL_3_0,
                "wrap-license", true,
                "translator-credits", _("translator-credits"),
                null
            );
        }

        static int main (string[] args) {
            var app = new Application ();

            Intl.bindtextdomain (
                Config.GETTEXT_PACKAGE,
                Config.GNOMELOCALEDIR
            );
            Intl.bind_textdomain_codeset (
                Config.GETTEXT_PACKAGE,
                Config.GNOMELOCALEDIR
            );
            Intl.textdomain (Config.GETTEXT_PACKAGE);

            return app.run (args);
        }
    }
}
