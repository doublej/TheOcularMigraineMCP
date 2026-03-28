import { registerPlugin } from '@capacitor/core'

export interface ShellExecPlugin {
  exec(options: { command: string }): Promise<{
    output: string
    error: string
    exitCode: number
  }>
  extractAsset(options: { name: string }): Promise<{
    path: string
  }>
}

export const ShellExec = registerPlugin<ShellExecPlugin>('ShellExec')
