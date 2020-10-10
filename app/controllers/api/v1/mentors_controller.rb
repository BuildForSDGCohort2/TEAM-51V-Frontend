module Api
  module V1
    class MentorsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_mentor, only: %i[show]

      def index
        render json: current_user.mentors #.where.not("mentorships.mentor_id": current_user.id) || []
      end

      def show
        render json: @mentor
      end

      private

      def set_mentor
        @mentor = User.find(params[:id])
      end
    end
  end
end
