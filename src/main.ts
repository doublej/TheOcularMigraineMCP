import '@fontsource-variable/sora'
import '@fontsource-variable/outfit'
import '@fontsource/space-mono/400.css'
import '@fontsource/space-mono/700.css'
import './app.css'
import App from './App.svelte'
import { mount } from 'svelte'

const app = mount(App, { target: document.getElementById('app')! })

export default app
