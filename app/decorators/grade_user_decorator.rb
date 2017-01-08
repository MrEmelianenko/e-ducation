class GradeUserDecorator < ApplicationDecorator
  def relation_type_readable
    I18n.t("grade_user.relations.#{relation_type}")
  end
end
