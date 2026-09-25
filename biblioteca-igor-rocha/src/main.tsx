import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import CardLivros from './components/CardLivros.tsx'


createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
    <CardLivros />
  </StrictMode>,
)
