defmodule Elyxel.Mailer do
  @moduledoc """
  An example module for sending emails.

  This example uses `mailgun`, but there are also other options available,
  such as `mailman`.
  """

  use Mailgun.Client, Application.get_env(:elyxel, :mailgun)

  @from "hello@mail.elyxel.com"

  @doc """
  An email with a confirmation link in it.
  """
  def ask_confirm(email, link) do
    confirm_url = "https://www.elyxel.com/confirm?#{link}"
    send_email to: email,
               from: @from,
               subject: "Request confirmation",
               html: Phoenix.View.render_to_string(Elyxel.EmailView, "ask_confirm.html", %{confirm_url: confirm_url})
  end

  @doc """
  An email with a link to reset the password.
  """
  def ask_reset(email, link) do
    confirm_url = "https://www.elyxel.com/reset?#{link}"
    send_email to: email,
               from: @from,
               subject: "Reset password",
               html: Phoenix.View.render_to_string(Elyxel.EmailView, "ask_reset.html", %{confirm_url: confirm_url})
  end

  @doc """
  An email acknowledging that the account has been successfully confirmed.
  """
  def receipt_confirm(email) do
    send_email to: email,
               from: @from,
               subject: "Successful confirmation",
               html: Phoenix.View.render_to_string(Elyxel.EmailView, "receipt_confirm.html", %{})
  end

  @doc """
  An email with an invite link to sign up.
  """
  def invite(email, link) do
    invite_url = "https://www.elyxel.com/signup?#{link}"
    send_email to: email,
               from: @from,
               subject: "You've been invited to Elyxel ⚡",
               html: Phoenix.View.render_to_string(Elyxel.EmailView, "invite.html", %{invite_url: invite_url})
  end
end