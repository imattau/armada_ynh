# Armada for YunoHost

Armada is an end-to-end encrypted community chat client built on Nostr. It
provides communities, channels, threads, moderation, encrypted direct
messages, and optional voice/video features.

This YunoHost package hosts the Armada web client. It does not install a Nostr
relay or LiveKit voice infrastructure. Armada can use public or administrator-
managed Nostr relays configured in the application settings.

Microphone and WebRTC features require HTTPS. Nostr authentication uses a
cryptographic key; it is independent of YunoHost accounts and LDAP.
