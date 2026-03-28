export type Tab = 'tune' | 'recording' | 'system'

let activeTab = $state<Tab>('tune')

export function getActiveTab() {
  return activeTab
}

export function setActiveTab(tab: Tab) {
  activeTab = tab
}
