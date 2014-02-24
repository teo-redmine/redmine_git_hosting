module RedmineGitHosting
  module Patches
    module RepositoriesControllerPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable

          alias_method_chain :show,    :git_hosting
          alias_method_chain :create,  :git_hosting
          alias_method_chain :update,  :git_hosting
          alias_method_chain :destroy, :git_hosting

          include GitHostingHelper
          helper :git_hosting
        end
      end

      module InstanceMethods

        def show_with_git_hosting(&block)
          if @repository.is_a?(Repository::Git) and @rev.blank?
            # Fake list of repos
            @repositories = @project.gitolite_repos
            render :action => 'git_instructions'
          else
            show_without_git_hosting(&block)
          end
        end


        def create_with_git_hosting(&block)
          create_without_git_hosting(&block)

          if @repository.is_a?(Repository::Git)
            if !@repository.errors.any?

              if params[:extra][:git_daemon] == 'true'
                params[:extra][:git_daemon] = 1
              else
                params[:extra][:git_daemon] = 0
              end

              if params[:extra][:git_notify] == 'true'
                params[:extra][:git_notify] = 1
              else
                params[:extra][:git_notify] = 0
              end

              @repository.extra.update_attributes(params[:extra])
              GitHosting.logger.info "User '#{User.current.login}' created a new repository '#{GitHosting.repository_name(@repository)}'"
              GitHosting.resync_gitolite({ :command => :add_repository, :object => @repository.id })
            end
          end
        end


        def update_with_git_hosting(&block)
          update_without_git_hosting(&block)

          if @repository.is_a?(Repository::Git)
            if !@repository.errors.any?

              if params[:extra][:git_daemon] == 'true'
                params[:extra][:git_daemon] = 1
              else
                params[:extra][:git_daemon] = 0
              end

              if params[:extra][:git_notify] == 'true'
                params[:extra][:git_notify] = 1
              else
                params[:extra][:git_notify] = 0
              end

              @repository.extra.update_attributes(params[:extra])
              GitHosting.logger.info "User '#{User.current.login}' has modified repository '#{GitHosting.repository_name(@repository)}'"
              GitHosting.resync_gitolite({ :command => :update_repository, :object => @repository.id })
            end
          end
        end


        def destroy_with_git_hosting(&block)
          destroy_without_git_hosting(&block)

          if @repository.is_a?(Repository::Git)
            if !@repository.errors.any?
              GitHosting.logger.info "User '#{User.current.login}' has removed repository '#{GitHosting.repository_name(@repository)}'"
              repository_data = Hash.new
              repository_data['repo_name']   = GitHosting.repository_name(@repository)
              repository_data['repo_path']   = GitHosting.repository_path(@repository)
              GitHosting.resync_gitolite({ :command => :delete_repositories, :object => [repository_data] })
            end
          end
        end

      end

    end
  end
end

unless RepositoriesController.included_modules.include?(RedmineGitHosting::Patches::RepositoriesControllerPatch)
  RepositoriesController.send(:include, RedmineGitHosting::Patches::RepositoriesControllerPatch)
end