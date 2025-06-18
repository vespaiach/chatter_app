import { application } from 'controllers/application'
import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading'
import FlashMessageController from 'controllers/flash_message_controller'
import SigninController from 'controllers/signin_controller'
import PasswordResetsController from 'controllers/password_resets_controller'
import ModalController from 'controllers/modal_controller'
import RoomFormController from 'controllers/room_form_controller'
import ProfileFormController from 'controllers/profile_form_controller'
import OpenModalButtonController from 'controllers/open_modal_button_controller'
import TopMenuController from 'controllers/top_menu_controller'
application.register('flash-message', FlashMessageController)
application.register('signin', SigninController)
application.register('password-resets', PasswordResetsController)
application.register('modal', ModalController)
application.register('room-form', RoomFormController)
application.register('profile-form', ProfileFormController)
application.register('open-modal-button', OpenModalButtonController)
application.register('top-menu', TopMenuController)

eagerLoadControllersFrom('controllers', application)