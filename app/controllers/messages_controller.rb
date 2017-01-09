class MessagesController < ApplicationController
  def create
    message = conversation.messages.new(message_params)
    message.user = current_user

    if message.save
      redirect_to conversation_path(conversation)
    else
      redirect_to conversation_path(conversation), notice: message.errors.full_messages.join('. ')
    end
  end

  private

  def conversation
    return @_conversation if defined?(@_conversation)
    @_conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:text)
  end
end
