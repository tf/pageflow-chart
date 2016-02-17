module PageflowChart
  class InstallGenerator < Pageflow::PageTypeInstallGenerator
    def engine
      Pageflow::Chart::Engine
    end
  end
end
