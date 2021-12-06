/* Task.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

 namespace Sandia {
    public class Task : GLib.Object  {
        public string title { get; set; }
        public bool completed { get; set; }

        public DateTime start_date { get; set; }
        public DateTime due_date { get; set; }
        public TaskRow row { get; set; }

        public Task () {
        }
    }
 }
