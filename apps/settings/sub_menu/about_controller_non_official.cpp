#include "about_controller.h"
#include "selectable_view_with_messages.h"

namespace Settings {

void AboutController::viewWillAppear() {
  GenericSubController::viewWillAppear();
  m_view.setMessages(nullptr, 0);
}

}
