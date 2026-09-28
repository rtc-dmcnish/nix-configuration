{pkgs,...}:
{
# Taskwarrior configuration
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      data.location = "~/.task";
      news.version = "3.5.0";
      sync.local.server_dir="~/Library/Mobile Documents/iCloud~com~mav~taskchamp/Documents/taskchamp";
      dateformat = "Y-M-D";
      report.next = {
        filter =  "+PENDING -BLOCKED -WAITING -hold limit:page";
      };
      report.work = {
        description = "Work Tasks";
        columns = [ "id" "start" "entry.age" "depends" "priority" "project" "tags" "recur" "scheduled" "due" "until" "description" ];
        labels = [ "ID" "Active" "Age" "Deps" "P" "Project" "Tags" "Recur" "Sched" "Due" "Until" "Description" ];
        sort = [ "priority-" "due+" "project+" "entry+" ];
        filter = "+PENDING -WAITING -hold limit:page -p";
      };
      report.home = {
        description = "Home Tasks";
        columns = [ "id" "start" "entry.age" "depends" "priority" "project" "tags" "recur" "scheduled" "due" "until" "description" ];
        labels = [ "ID" "Active" "Age" "Deps" "P" "Project" "Tags" "Recur" "Sched" "Due" "Until" "Description" ];
        sort = [ "priority-" "due+" "project+" "entry+" ];
        filter = "+PENDING -WAITING -hold limit:page +p";
      };
    };
  };
  programs.zsh.shellAliases = {
    tw = "task work";
    th = "task +p";
  };
}
