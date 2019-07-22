defmodule MyModule do

  require Mod
  #Mod.definfo
  Mod.defcalendar

  def fun_fake() do
    MyModule.get_calendar_info
  end

end
