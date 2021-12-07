/* TaskList.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Sandia {
    public class TaskList : GLib.Object {
        public string title { get; set; }
        public uint task_number { get; set; }

        public GLib.HashTable tasks { get; set; }

        public TaskList () {
            var task = new Task ();
        }
    }
}
