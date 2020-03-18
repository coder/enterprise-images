# enterprise-images

These docs contain examples and guides for how to setup your images to utilize
the Multi Editor Support built into Coder Enterprise.

Each directory contains examples for how to setup your images
with different IDEs.

## Multi Editor Support
*Multi Editor Support is currently in alpha, see [known issues](#known-issues) for more details.*

Coder Enterprise has full support for a wide range of editors including VSCode,
the JetBrains suite, Eclipse, and many more. These editors are run in the remote
environment and rendered directly in the browser. The multi editor support is
bundled with a window management system to give the application the look
and feel of a native local application. This provides the best of both
worlds -- the security and productivity of remote infrastructure with the native look
and feel of the local machine.

### Installing an IDE into your docker image:
Installing an IDE into your image can be done using the same methods that you would
normally use when installing the IDE onto your local machine. Code-server is able to
find and start the following IDEs if their binaries exist in your PATH:
- intellij-idea-ultimate
- intellij-idea-community
- eclipse
- goland
- pycharm
- phpstorm
- clion
- rider
- rubymine
- datagrip
- oni
- monodevelop
- emacs

For a cleaner experience, a [.desktop]() entry can be added into your
`/usr/share/applications` to make the IDE discoverable by code-server. Adding the `.desktop`
entry will render the applications Logo and name on the code-server dashboard.

### Desktop File
The `.desktop` file gives code-server information about the IDE such as the name,
where to find the logo to display, and what command to run to start the application.
The following fields are required in the `.desktop` file for code-server to be able
to discover and start your installed IDE:

| Field  | Description  | Required / Optional  |
|---|---|---|
| Name  | The name you would like to use for your application | Required  |
| Type  | This must be set to `Application` for code-server to render it  | Required  |
| Logo  | The path to the logo you'd like code-server to use for displaying your IDE  | Optional  |
| Exec  | The path to the command that is used to start the IDE  | Required  |

### Required Packages
The following packages are required in your image if you're using an IDE other than VSCode
to ensure that it can communicate properly with code-server.
| Deb Package  | Rpm Package  | Package Description  |
|---|---|---|
| openssl | openssl | Secure Sockets Layer Toolkit |
| libxtst6 | libXtst | X11 Testing Library |
| libxrender1 | libXrender | X Rendering Extension Client Library |
| libfontconfig1 | fontconfig | Generic Font Configuration Library |
| libxi6 | libXi | X11 Input Extension Library |
| libgtk-3-0 | gtk3 | GTK+ Graphical User Interface Library |

### How does IDE licensing work?
Licensing for IDEs running via code-server are licensed in the same way that they are
when running them on your local machine. If your IDE requires a license for use locally,
it will still require one when running it through code-server.

### What editors are known to work?
- VSCode
- IntelliJ IDEA Ultimate and Community editions
- Eclipse - [GTK Based](#known-issues)
- PyCharm
- GoLand
- PhpStorm
- RubyMine
- CLion
- Rider
- DataGrip
- Emacs
- Vim
- Oni
- MonoDevelop

### Known Issues
- Reconnects don’t currently work, if your internet connection is unstable or goes out,
we recommend using the built in VSCode IDE until we can resolve this issue.
- Opening and closing an application many times can cause code-server to get into a broken
state. We recommend minimizing the opens and closes of a single application until we’re able
to resolve this.
- Resizing the application window too quickly can cause it to enter into an unexpected state.
Please resize slowly to ensure things work as expected.
- GTK based applications are not registering keyboard input successfully. We recommend using
non GTK based IDEs until we can resolve this issue.