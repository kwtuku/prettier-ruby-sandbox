module Users
  class QuestionnairesController < ApplicationController
    before_action :set_questionnaire, only: %i[show edit update destroy]

    def index
      @questionnaires = current_user.questionnaires.order(created_at: :desc)
    end

    def show
    end

    def new
      @questionnaire = current_user.questionnaires.new
    end

    def edit
    end

    def create
      @questionnaire = current_user.questionnaires.new(questionnaire_params)

      if @questionnaire.save
        redirect_to users_questionnaire_path(@questionnaire),
                    notice: "Questionnaire was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @questionnaire.update(questionnaire_params)
        redirect_to users_questionnaire_path(@questionnaire),
                    notice: "Questionnaire was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @questionnaire.destroy!
      redirect_to users_questionnaires_path,
                  notice: "Questionnaire was successfully destroyed."
    end

    private

    def set_questionnaire
      @questionnaire = current_user.questionnaires.find(params[:id])
    end

    def questionnaire_params
      params.require(:questionnaire).permit(
        :title,
        :description,
        :level,
        :visibility,
        :agreed,
        :comfortable,
        :expire_on,
        :start_at,
        :end_at,
        labelings_attributes: %i[id label_id color _destroy],
      )
    end
  end
end
