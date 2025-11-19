# Lightweight Server Dotfiles

Облегченная конфигурация для удаленных серверов с минимальными системными требованиями и темой GitHub Dark.

## Основные характеристики

- **Производительность**: Быстрая загрузка (~200-300мс для zsh)
- **Минимальное использование памяти**: ~15-20MB для zsh
- **Без тяжелых плагинов**: Нет Powerlevel10k, нет полного oh-my-zsh, нет TPM
- **GitHub Dark тема**: Единая цветовая схема для zsh и tmux
- **Оптимизировано для слабого железа**

## Возможности

### ZSH
- ✅ Простой двухстрочный prompt с GitHub Dark цветами
- ✅ Git aliases и автодополнения
- ✅ Docker/Docker Compose поддержка
- ✅ FZF интеграция с GitHub Dark темой
- ✅ SDKMAN для Java/JVM
- ✅ Tree утилита с fallback
- ✅ zsh-autosuggestions
- ❌ Без syntax highlighting (экономия CPU)
- ❌ Без Kubernetes плагинов

### Tmux
- ✅ GitHub Dark статус-бар
- ✅ Vim-tmux навигация (без плагина)
- ✅ Session management keybindings
- ✅ Удобные сплиты окон (| и -)
- ❌ Без TPM и плагинов

---

## Требования

Убедитесь, что у вас установлены следующие компоненты:

### Zsh
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y zsh

# CentOS/RHEL
sudo yum install -y zsh

# Alpine
apk add zsh
```

Установите zsh как shell по умолчанию:
```bash
chsh -s $(which zsh)
```

Проверьте shell:
```bash
echo $SHELL
```

### Git
```bash
# Ubuntu/Debian
sudo apt install -y git

# CentOS/RHEL
sudo yum install -y git

# Alpine
apk add git
```

### Stow
```bash
# Ubuntu/Debian
sudo apt install -y stow

# CentOS/RHEL
sudo yum install -y stow

# Alpine
apk add stow
```

### Tmux
```bash
# Ubuntu/Debian
sudo apt install -y tmux

# CentOS/RHEL
sudo yum install -y tmux

# Alpine
apk add tmux
```

**Примечание**: TPM (Tmux Plugin Manager) НЕ требуется - все настроено вручную!

### Tree (опционально, но рекомендуется)
```bash
# Ubuntu/Debian
sudo apt install -y tree

# CentOS/RHEL
sudo yum install -y tree

# Alpine
apk add tree
```

Если tree не установлен, конфигурация автоматически использует fallback через `find`.

---

## Установка

### 1. Клонирование репозитория
```bash
git clone https://github.com/mdondukov/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Создание симлинков с помощью Stow
```bash
stow .
```

### 3. Применение конфигурации ZSH
```bash
source ~/.zshrc
```

Zinit автоматически установит необходимые плагины при первом запуске.

### 4. Применение конфигурации Tmux
Запустите tmux и нажмите `Ctrl+a r` для перезагрузки конфигурации:
```bash
tmux
# Внутри tmux: Ctrl+a, затем r
```

---

## Пост-установка

### FZF (Fuzzy Finder)
FZF настроен с GitHub Dark цветами и интегрирован в zsh.

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

При установке выберите:
- Enable fuzzy auto-completion: **Yes**
- Enable key bindings: **Yes**
- Update shell configuration files: **No** (уже настроено в .zshrc)

### SDKMAN (Java/JVM Version Manager)
```bash
# Установка зависимостей
# Ubuntu/Debian
sudo apt install -y zip curl

# CentOS/RHEL
sudo yum install -y zip curl

# Alpine
apk add zip curl

# Установка SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### Docker (опционально)
```bash
# Ubuntu/Debian
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# Перелогиньтесь для применения изменений
```

---

## Использование

### Tmux Keybindings

**Prefix**: `Ctrl+a`

#### Session Management
- `Ctrl+a s` - Список сессий (сортировка по имени)
- `Ctrl+a N` - Новая сессия
- `Ctrl+a R` - Переименовать сессию
- `Ctrl+a X` - Убить сессию

#### Window Management
- `Ctrl+a c` - Новое окно
- `Ctrl+a |` - Вертикальный сплит
- `Ctrl+a -` - Горизонтальный сплит

#### Pane Navigation
- `Ctrl+h/j/k/l` - Навигация между панелями (работает с vim)
- `Ctrl+a H/J/K/L` - Изменение размера панелей

#### Other
- `Ctrl+a r` - Перезагрузить конфигурацию

### ZSH Features

#### Git Aliases (от oh-my-zsh)
Доступны стандартные git aliases:
- `gs` - git status
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- И многие другие...

#### Docker Aliases
- `dc` - docker compose

#### FZF Shortcuts
- `Ctrl+r` - Поиск по истории команд
- `Ctrl+t` - Fuzzy поиск файлов
- `Alt+c` - Fuzzy поиск директорий

---

## GitHub Dark Цветовая схема

### Палитра цветов
```
Background:  #0d1117
Surface:     #161b22
Text:        #c9d1d9
Muted:       #8b949e
Blue:        #58a6ff
Green:       #3fb950
Red:         #f85149
Yellow:      #d29922
```

### ZSH Prompt
- **User@Host**: Синий (#58a6ff)
- **Path**: Зеленый (#3fb950)
- **Git Branch**: Желтый (#d29922)
- **Arrow**: Зеленый (успех) / Красный (ошибка)
- **Time**: Серый (#8b949e)

### Tmux Status Bar
- **Background**: #0d1117
- **Session Name**: Синий фон (#58a6ff)
- **Active Window**: Зеленый текст (#3fb950)
- **Inactive Window**: Серый текст (#8b949e)
- **Active Pane Border**: Синий (#58a6ff)

---

## Производительность

### Сравнение с тяжелой конфигурацией

| Параметр | Тяжелая конфига | Легкая конфига |
|----------|----------------|----------------|
| Загрузка zsh | ~1000мс | ~200-300мс |
| Память zsh | ~50MB | ~15-20MB |
| Плагины zsh | 10+ | 4 |
| Tmux плагины | 5+ | 0 |

### Что было удалено
- ❌ Powerlevel10k (тяжелая тема)
- ❌ zsh-syntax-highlighting (CPU overhead)
- ❌ Полный oh-my-zsh framework
- ❌ kubectl/kubectx плагины
- ❌ command-not-found плагин
- ❌ TPM (Tmux Plugin Manager)
- ❌ Catppuccin тема для tmux
- ❌ tmux-resurrect/continuum
- ❌ Все tmux плагины

### Что было сохранено
- ✅ Git плагин (полезные aliases)
- ✅ Docker/Docker Compose плагины
- ✅ zsh-autosuggestions (легкий)
- ✅ FZF интеграция
- ✅ SDKMAN
- ✅ Базовые автодополнения
- ✅ Vim-tmux навигация (без плагина)

---

## Troubleshooting

### Prompt выглядит странно
Убедитесь, что ваш терминал поддерживает TrueColor (24-bit):
```bash
echo $COLORTERM
# Должно показать: truecolor
```

### Zinit не устанавливает плагины
При первом запуске zsh Zinit автоматически клонирует себя и установит плагины. Если этого не произошло:
```bash
rm -rf ~/.local/share/zinit
source ~/.zshrc
```

### Vim-tmux навигация не работает
Убедитесь, что в вашем vim/neovim есть соответствующие keybindings для `Ctrl+h/j/k/l`.

### Tree не работает
Установите tree или используйте встроенный fallback (уже настроен в .zshrc).

---

## Ветки репозитория

- `master` - основная ветка (для macOS/desktop)
- `linux-server` - **облегченная серверная конфигурация** (текущая)

---

## Лицензия

MIT
