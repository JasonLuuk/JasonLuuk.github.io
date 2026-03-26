---
slug: "cangjie-central-repository-launch"
title: "Cangjie Central Repository Is Now Live — A New Era of Third-Party Package Management Has Arrived"
description: "The official Cangjie Central Repository is now live, bringing version management, centralised package discovery, and automatic dependency resolution to the Cangjie ecosystem."
date: "23/03/2026"
authors:
  - "The Cangjie Programming Language UK Team"
descriptionImage: "figures/cangjie-central-repository.png"
tags:
  - "Package Management"
  - "Repository"
  - "Dependencies"
  - "Ecosystem"
  - "Nightly Builds"
---

# Cangjie Central Repository Is Now Live — A New Era of Third-Party Package Management Has Arrived

## Introduction

## 1. What Is the Cangjie Central Repository?

The Cangjie Central Repository (仓颉中心仓) is the official package hosting platform for the Cangjie programming language. It provides capabilities for publishing, browsing, discovering, and resolving dependencies for source-based third-party packages.

The Central Repository is accessible at:

🔗 [https://pkg.cangjie-lang.cn](https://pkg.cangjie-lang.cn)

## 2. Who Is It For?

The Central Repository is intended for all Cangjie language developers. At present, the Central Repository client is available exclusively in the Nightly Builds edition.

Users are encouraged to upgrade to the latest SDK version to access this functionality:

🔗 [Nightly Builds](https://gitcode.com/Cangjie/nightly_build)

## Core Features

The Cangjie Central Repository is designed to substantially improve the experience of publishing and consuming third-party packages for Cangjie developers. It addresses three long-standing pain points in the ecosystem.

### 1. Version Publishing and Management

Previously, third-party packages were managed via Git repositories, with dependencies specified through branches or tags, with no formal version management in place. The Central Repository introduces comprehensive version management capabilities alongside an ergonomic version configuration syntax.

### 2. Centralised Package Discovery

Previously, developers published packages through code-hosting platforms and shared them informally, while consumers relied on search engines to locate what they needed. A centralised discovery platform was sorely lacking.

The Central Repository now gives package authors a dedicated venue to publish and showcase their work, and provides consumers with search and browsing functionality in a single location.

### 3. Automatic Dependency Resolution and Download

Previously, resolving version conflicts among direct or transitive dependencies required entirely manual intervention, a cumbersome and error-prone process.

The Central Repository client now performs automatic dependency analysis, including transitive dependencies, and automated downloading, computing the optimal dependency solution on the developer's behalf.

## Usage Guide

Comprehensive documentation and usage examples are available in the official Central Repository documentation, accessible via the **Reference Docs** link on the Central Repository homepage.

### 1. The Central Repository Website

- **Account registration and login:** Access to the Central Repository website requires linking a GitCode account.
- **Package search:** Enter a package name into the search box on the homepage to locate the corresponding package entry. Clicking an entry displays the full details of its latest release.
- **Organisation management:** The Organisations page can be reached from the personal dashboard, where you can create and manage organisations.

### 2. The Central Repository Client

- **Local environment configuration:** Enable Central Repository functionality by specifying the repository URL and your personal access token in the SDK configuration file at `tools/config/cangjie-repo.toml`.
- **Publishing a package:** Use the `cjpm bundle/publish` command to bundle a local `cjpm` module into a source package and publish it to the Central Repository.
- **Consuming a package:** Declare Central Repository dependencies in the `dependencies` field and related fields of your project configuration using the version configuration syntax. You may pin a specific version or specify a version range. `cjpm` will apply its automated dependency resolution algorithm to determine the optimal version.

## Building Together — From "Functional" to "Excellent"

As a nascent platform, we must be candid about the current limitations. Compared with mature registries in more established language ecosystems, the Central Repository still has room to grow:

- Search is not yet intelligent enough, and finding the right library will become harder as the number of packages grows.
- Package detail pages are still incomplete. Information users care about, such as dependency relationship graphs, is currently absent.
- The API interface has not yet been implemented, which constrains deep integration with IDE plugins and CI/CD pipelines.
- Performance and reliability have yet to be stress-tested against a large concurrent user base.

Future work will focus on delivering an exceptional developer experience, cultivating an open ecosystem, and continuously improving performance and reliability.

## Special Acknowledgements

We dedicate this moment to every developer who lit a star for the Cangjie Central Repository during its closed beta. Thank you for your support and companionship. The Cangjie ecosystem is richer for your presence.
