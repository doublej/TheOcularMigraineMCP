<script lang="ts">
  import TabBar from './lib/components/layout/TabBar.svelte'
  import Toast from './lib/components/ui/Toast.svelte'
  import { getActiveTab } from './lib/stores/navigation.svelte'
  import Tune from './views/Tune.svelte'
  import Recording from './views/Recording.svelte'
  import System from './views/System.svelte'
</script>

<Toast />

<div class="app">
  <main class="content">
    {#if getActiveTab() === 'tune'}
      <Tune />
    {:else if getActiveTab() === 'recording'}
      <Recording />
    {:else if getActiveTab() === 'system'}
      <System />
    {/if}
  </main>
  <TabBar />
</div>

<style>
  .app {
    height: 100%;
    display: flex;
    flex-direction: column;
    position: relative;
  }

  .app::after {
    content: '';
    position: fixed;
    inset: 0;
    opacity: 0.015;
    pointer-events: none;
    z-index: 9999;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
    background-size: 128px 128px;
  }

  .content {
    flex: 1;
    overflow-y: auto;
    overflow-x: hidden;
    padding-bottom: var(--tab-height);
  }
</style>
