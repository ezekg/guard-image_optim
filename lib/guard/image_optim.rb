require "guard"
require "guard/plugin"
require "guard/watcher"
require "pathname"
require "image_optim"
require "image_optim_pack"

###
# Guard to optimize images
###
module Guard
    class ImageOptim < Plugin

        ###
        # Initializer
        ###
        def initialize(options = {})
            options = {
                :input => "images",
                :nice => 10,
                :notifications => true,
                :run_at_start => false,
                :pngout => false,
                :svgo => false
            }.merge(options)

            @optimizer = ::ImageOptim.new({
                :nice => options[:nice],
                :pngout => options[:pngout],
                :svgo => options[:svgo]
            })

            super(options)

            if options[:input]
                watchers << ::Guard::Watcher.new(%r{^#{options[:input]}/*.*$})
            end
        end

        ###
        # Run at start
        ###
        def start
            run_all if options[:run_at_start]
        end

        ###
        # Stop running
        ###
        def stop
            true
        end

        ###
        # On Guard reload
        ###
        def reload
            run_all
        end

        ###
        # Run all
        ###
        def run_all
            run_on_changes Watcher.match_files(self, Dir.glob(File.join("**", "*.*")))
        end

        ###
        # Run on changes to watched files
        #
        # @param {Array} paths
        #   Paths of changed files
        ###
        def run_on_changes(paths)
            paths.each do |file|
                optimize! Pathname.new(file).realpath
            end
        end

        ###
        # Called when a watched file is removed
        #
        # @param {Array} paths
        #   Paths of changed files
        ####
        def run_on_removals(paths)
        end

        private

        ###
        # Optimize file
        #
        # @param {String} file
        ###
        def optimize!(file)
            begin
                throw :task_has_failed unless @optimizer.optimize_image! file
                ::Guard::UI.info(color("optimized #{File.basename(file)}", ";32")) if options[:notifications]
            rescue StandardError => error
                ::Guard::UI.error(color("error optimizing #{File.basename(file)} : #{error}", ";31")) if options[:notifications]
            end
        end

        ###
        # Set message color
        #
        # @param {String} message
        #   Text to color
        # @param {String} color
        #   Color code
        ###
        def color(message, color)
            if ::Guard::UI.send(:color_enabled?)
                "\e[0#{color}m#{message}\e[0m"
            else
                message
            end
        end
    end
end
